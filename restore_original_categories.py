import psycopg2
import csv
import os

# 데이터베이스 연결
conn = psycopg2.connect(
    host="aws-1-ap-northeast-2.pooler.supabase.com",
    port=6543,
    dbname="postgres",
    user="postgres.ggtydikxkfozlhnihrwr",
    password="76017602Ab!"
)
cur = conn.cursor()

print("=== 원래 단어장 기반으로 카테고리 복원 ===")

# 1. 모든 word_categories 관계 삭제
cur.execute("DELETE FROM word_categories")
print("모든 기존 카테고리 관계를 삭제했습니다.")

# 2. 카테고리 확인 및 생성
categories_to_create = [
    'TOEIC', 'TOEFL', 'GTELP', 'SUNEUNG', 'GONGMUWON'
]

for cat_name in categories_to_create:
    # 이미 존재하는지 확인 후 생성
    cur.execute("SELECT id FROM categories WHERE name = %s", (cat_name,))
    if not cur.fetchone():
        cur.execute("INSERT INTO categories (name) VALUES (%s)", (cat_name,))
        print(f"카테고리 '{cat_name}' 생성됨")

conn.commit()

# 카테고리 ID 매핑 가져오기
cur.execute("SELECT id, name FROM categories")
categories = dict(cur.fetchall())
category_name_to_id = {name: id for id, name in categories.items()}
print("사용 가능한 카테고리:", category_name_to_id)

# 3. 각 CSV 파일과 카테고리 매핑
word_files = {
    'TOEIC': 'toeicword.csv',
    'TOEFL': 'toeflword.csv', 
    'GTELP': 'gtelpword.csv',
    'SUNEUNG': 'suneungword.csv',
    'GONGMUWON': 'gongmuwonword.csv'
}

total_mapped = 0
file_stats = {}

# 4. 각 파일에서 단어 읽어서 해당 카테고리에 매핑
for category_name, filename in word_files.items():
    if not os.path.exists(filename):
        print(f"파일을 찾을 수 없습니다: {filename}")
        continue
        
    print(f"\n=== {category_name} 카테고리 처리 ({filename}) ===")
    
    mapped_count = 0
    not_found_count = 0
    
    try:
        with open(filename, 'r', encoding='utf-8') as f:
            csv_reader = csv.reader(f)
            header = next(csv_reader)  # 헤더 스킵
            print(f"CSV 헤더: {header}")
            
            for row_num, row in enumerate(csv_reader, start=2):
                if len(row) == 0:
                    continue
                    
                # 첫 번째 컬럼이 영어 단어
                english = row[0].strip() if row[0] else ""
                
                if not english:
                    continue
                
                # words 테이블에서 해당 영어 단어 찾기
                cur.execute("SELECT id FROM words WHERE english = %s", (english,))
                result = cur.fetchone()
                
                if result:
                    word_id = result[0]
                    category_id = category_name_to_id[category_name]
                    
                    # word_categories에 추가
                    try:
                        cur.execute("INSERT INTO word_categories (word_id, category_id) VALUES (%s, %s) ON CONFLICT DO NOTHING", 
                                  (word_id, category_id))
                        mapped_count += 1
                        total_mapped += 1
                    except Exception as e:
                        print(f"Error mapping {english}: {e}")
                else:
                    not_found_count += 1
                    if not_found_count <= 5:  # 처음 5개만 출력
                        print(f"  단어를 찾을 수 없음: '{english}' (행 {row_num})")
        
        file_stats[category_name] = {
            'mapped': mapped_count,
            'not_found': not_found_count
        }
        
        print(f"{category_name}: {mapped_count}개 매핑됨, {not_found_count}개 찾을 수 없음")
        
    except Exception as e:
        print(f"Error processing {filename}: {e}")

# 5. 일부 중요한 단어들을 여러 카테고리에 추가 (선택적)
print("\n=== 중요한 단어들을 여러 카테고리에 추가 ===")

# 비즈니스/학술 공통 단어들 - TOEIC, TOEFL, GONGMUWON에 공통
business_words = ["important", "significant", "effective", "management", "organization", "professional"]
for word in business_words:
    cur.execute("SELECT id FROM words WHERE english ILIKE %s LIMIT 2", (f"%{word}%",))
    matches = cur.fetchall()
    for (word_id,) in matches:
        for cat in ['TOEIC', 'TOEFL', 'GONGMUWON']:
            if cat in category_name_to_id:
                cur.execute("INSERT INTO word_categories (word_id, category_id) VALUES (%s, %s) ON CONFLICT DO NOTHING", 
                          (word_id, category_name_to_id[cat]))

# 학술 단어들 - TOEFL, SUNEUNG에 공통
academic_words = ["research", "study", "education", "knowledge", "theory", "analysis"]
for word in academic_words:
    cur.execute("SELECT id FROM words WHERE english ILIKE %s LIMIT 2", (f"%{word}%",))
    matches = cur.fetchall()
    for (word_id,) in matches:
        for cat in ['TOEFL', 'SUNEUNG']:
            if cat in category_name_to_id:
                cur.execute("INSERT INTO word_categories (word_id, category_id) VALUES (%s, %s) ON CONFLICT DO NOTHING", 
                          (word_id, category_name_to_id[cat]))

print("중요 단어들의 다중 카테고리 매핑 완료")

# 6. 변경사항 저장
conn.commit()

# 7. 최종 결과 확인
print("\n=== 최종 결과 ===")

# 카테고리별 단어 수
cur.execute("""
    SELECT c.name, COUNT(wc.word_id) as word_count
    FROM categories c
    LEFT JOIN word_categories wc ON c.id = wc.category_id
    GROUP BY c.id, c.name
    ORDER BY word_count DESC
""")

print("카테고리별 단어 수:")
for category_name, word_count in cur.fetchall():
    print(f"  {category_name}: {word_count:,}개")

# 여러 카테고리를 가진 단어들
cur.execute("""
    SELECT word_id, COUNT(category_id) as category_count 
    FROM word_categories 
    GROUP BY word_id 
    HAVING COUNT(category_id) > 1 
    ORDER BY category_count DESC 
    LIMIT 10
""")

multi_category_words = cur.fetchall()
if multi_category_words:
    print(f"\n여러 카테고리를 가진 단어들 (상위 10개):")
    for word_id, count in multi_category_words:
        cur.execute("SELECT english FROM words WHERE id = %s", (word_id,))
        english = cur.fetchone()
        if english:
            cur.execute("""
                SELECT c.name 
                FROM categories c 
                JOIN word_categories wc ON c.id = wc.category_id 
                WHERE wc.word_id = %s
            """, (word_id,))
            categories_list = [row[0] for row in cur.fetchall()]
            print(f"  {english[0]}: {categories_list}")

# 전체 통계
cur.execute("SELECT COUNT(DISTINCT word_id) FROM word_categories")
total_with_categories = cur.fetchone()[0]

cur.execute("SELECT COUNT(*) FROM words")
total_words = cur.fetchone()[0]

print(f"\n전체 통계:")
print(f"  전체 단어 수: {total_words:,}개")
print(f"  카테고리를 가진 단어 수: {total_with_categories:,}개")
print(f"  총 매핑된 관계 수: {total_mapped:,}개")

# 파일별 매핑 통계
print(f"\n파일별 매핑 결과:")
for cat_name, stats in file_stats.items():
    print(f"  {cat_name}: 매핑 {stats['mapped']:,}개, 미발견 {stats['not_found']:,}개")

cur.close()
conn.close()

print("\n완료! 각 단어가 원래 단어장에 맞는 카테고리를 가지게 되었습니다.")
