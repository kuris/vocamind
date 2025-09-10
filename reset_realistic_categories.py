import psycopg2
import random

# 데이터베이스 연결
conn = psycopg2.connect(
    host="aws-1-ap-northeast-2.pooler.supabase.com",
    port=6543,
    dbname="postgres",
    user="postgres.ggtydikxkfozlhnihrwr",
    password="76017602Ab!"
)
cur = conn.cursor()

print("=== 모든 카테고리 연결 제거하고 현실적인 다중 카테고리 설정 ===")

# 1. 모든 word_categories 관계 삭제
cur.execute("DELETE FROM word_categories")
print("모든 기존 카테고리 관계를 삭제했습니다.")

# 2. 카테고리 ID 매핑 가져오기
cur.execute("SELECT id, name FROM categories")
categories = dict(cur.fetchall())
category_name_to_id = {name: id for id, name in categories.items()}
print("카테고리 매핑:", category_name_to_id)

# 3. 각 카테고리별 단어 파일에서 원래 단어들 다시 추가
word_files = {
    'TOEIC': 'toeicword.csv',
    'TOEFL': 'toeflword.csv', 
    'GTELP': 'gtelpword.csv',
    'SUNEUNG': 'suneungword.csv'
}

# 원래 파일들에서 단어 읽기
for category_name, filename in word_files.items():
    try:
        print(f"\n=== {category_name} 카테고리 단어들 추가 ===")
        
        # CSV 파일에서 단어 읽기
        with open(filename, 'r', encoding='utf-8') as f:
            lines = f.readlines()
        
        added_count = 0
        for line in lines[1:]:  # 헤더 제외
            parts = line.strip().split(',')
            if len(parts) >= 2:
                english = parts[0].strip()
                
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
                        added_count += 1
                    except Exception as e:
                        print(f"Error adding {english}: {e}")
        
        print(f"{category_name}: {added_count}개 단어 추가됨")
        
    except FileNotFoundError:
        print(f"파일을 찾을 수 없습니다: {filename}")
    except Exception as e:
        print(f"Error processing {filename}: {e}")

# 4. 중요한 단어들을 추가로 여러 카테고리에 연결
print("\n=== 중요한 단어들을 여러 카테고리에 연결 ===")

# 비즈니스/학술 공통 단어들
business_academic_words = [
    "analysis", "research", "development", "management", "organization", 
    "professional", "effective", "significant", "essential", "important",
    "provide", "include", "require", "consider", "develop", "create",
    "maintain", "establish", "achieve", "determine"
]

# 과학/기술 단어들
science_tech_words = [
    "science", "technology", "method", "system", "process", "theory",
    "experiment", "data", "result", "conclusion"
]

# 사회/문화 단어들
social_cultural_words = [
    "society", "culture", "community", "public", "government", 
    "international", "global", "social", "economic", "political"
]

# TOEIC + TOEFL 공통
for word in business_academic_words:
    cur.execute("SELECT id FROM words WHERE english ILIKE %s", (f"%{word}%",))
    matches = cur.fetchall()
    for (word_id,) in matches[:3]:  # 최대 3개만
        for cat in ['TOEIC', 'TOEFL']:
            cur.execute("INSERT INTO word_categories (word_id, category_id) VALUES (%s, %s) ON CONFLICT DO NOTHING", 
                      (word_id, category_name_to_id[cat]))

print("비즈니스/학술 단어들을 TOEIC, TOEFL에 추가했습니다.")

# TOEFL + SUNEUNG 공통 (과학/기술)
for word in science_tech_words:
    cur.execute("SELECT id FROM words WHERE english ILIKE %s", (f"%{word}%",))
    matches = cur.fetchall()
    for (word_id,) in matches[:2]:  # 최대 2개만
        for cat in ['TOEFL', 'SUNEUNG']:
            cur.execute("INSERT INTO word_categories (word_id, category_id) VALUES (%s, %s) ON CONFLICT DO NOTHING", 
                      (word_id, category_name_to_id[cat]))

print("과학/기술 단어들을 TOEFL, SUNEUNG에 추가했습니다.")

# 모든 카테고리 공통 (사회/문화)
for word in social_cultural_words:
    cur.execute("SELECT id FROM words WHERE english ILIKE %s", (f"%{word}%",))
    matches = cur.fetchall()
    for (word_id,) in matches[:1]:  # 최대 1개만
        for cat in ['TOEIC', 'TOEFL', 'GTELP', 'SUNEUNG']:
            cur.execute("INSERT INTO word_categories (word_id, category_id) VALUES (%s, %s) ON CONFLICT DO NOTHING", 
                      (word_id, category_name_to_id[cat]))

print("사회/문화 단어들을 모든 카테고리에 추가했습니다.")

# 5. 변경사항 저장
conn.commit()

# 6. 결과 확인
print("\n=== 최종 결과 ===")

# 카테고리별 단어 수 확인
cur.execute("""
    SELECT c.name, COUNT(wc.word_id) as word_count
    FROM categories c
    LEFT JOIN word_categories wc ON c.id = wc.category_id
    GROUP BY c.id, c.name
    ORDER BY word_count DESC
""")

for category_name, word_count in cur.fetchall():
    print(f"{category_name}: {word_count}개 단어")

# 여러 카테고리를 가진 단어들 확인
cur.execute("""
    SELECT word_id, COUNT(category_id) as category_count 
    FROM word_categories 
    GROUP BY word_id 
    HAVING COUNT(category_id) > 1 
    ORDER BY category_count DESC 
    LIMIT 10
""")

multi_category_words = cur.fetchall()
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
        print(f"  {english[0]}: {count}개 카테고리 {categories_list}")

cur.close()
conn.close()

print("\n완료! 이제 각 카테고리에 적절한 수의 단어가 있고, 일부 단어는 여러 카테고리에 속합니다.")
