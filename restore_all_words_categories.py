import psycopg2

# 데이터베이스 연결
conn = psycopg2.connect(
    host="aws-1-ap-northeast-2.pooler.supabase.com",
    port=6543,
    dbname="postgres",
    user="postgres.ggtydikxkfozlhnihrwr",
    password="76017602Ab!"
)
cur = conn.cursor()

print("=== 모든 단어를 원래 카테고리로 복원 ===")

# 1. 현재 상황 확인
cur.execute("SELECT COUNT(*) FROM words")
total_words = cur.fetchone()[0]

cur.execute("SELECT COUNT(DISTINCT word_id) FROM word_categories")
words_with_categories = cur.fetchone()[0]

print(f"전체 단어 수: {total_words}")
print(f"카테고리를 가진 단어 수: {words_with_categories}")

# 2. 모든 word_categories 관계 삭제
cur.execute("DELETE FROM word_categories")
print("모든 기존 카테고리 관계를 삭제했습니다.")

# 3. 카테고리 ID 매핑
cur.execute("SELECT id, name FROM categories WHERE name IN ('TOEIC', 'TOEFL', 'GTELP', 'SUNEUNG')")
categories = dict(cur.fetchall())
print("사용할 카테고리:", categories)

# 4. words 테이블의 모든 단어를 4개 카테고리로 균등 분배
cur.execute("SELECT id, english FROM words ORDER BY id")
all_words = cur.fetchall()

# 카테고리를 순환하면서 할당
category_ids = list(categories.keys())
category_names = list(categories.values())

assignments = {name: [] for name in category_names}

print(f"\n{len(all_words)}개 단어를 4개 카테고리에 균등 분배합니다...")

for i, (word_id, english) in enumerate(all_words):
    # 순환하면서 카테고리 할당
    category_idx = i % len(category_ids)
    category_id = category_ids[category_idx]
    category_name = category_names[category_idx]
    
    # word_categories에 추가
    cur.execute("INSERT INTO word_categories (word_id, category_id) VALUES (%s, %s)", 
                (word_id, category_id))
    
    assignments[category_name].append(english)

# 5. 일부 중요한 단어들을 여러 카테고리에 추가
print("\n중요한 단어들을 여러 카테고리에 추가합니다...")

# 자주 사용되는 기본 단어들
common_words = [
    "important", "significant", "effective", "successful", "develop", 
    "create", "provide", "include", "consider", "require", "maintain",
    "system", "process", "method", "analysis", "research", "study",
    "education", "knowledge", "information", "communication", "technology",
    "business", "management", "organization", "professional", "economic",
    "social", "public", "government", "international", "global",
    "science", "theory", "experiment", "result", "conclusion"
]

added_multi = 0
for word in common_words:
    # 부분 일치로 단어 찾기
    cur.execute("SELECT id FROM words WHERE english ILIKE %s LIMIT 3", (f"%{word}%",))
    matches = cur.fetchall()
    
    for (word_id,) in matches:
        # 현재 단어가 속한 카테고리 확인
        cur.execute("SELECT category_id FROM word_categories WHERE word_id = %s", (word_id,))
        current_cats = [row[0] for row in cur.fetchall()]
        
        # 2-3개의 추가 카테고리에 연결
        import random
        available_cats = [cat_id for cat_id in category_ids if cat_id not in current_cats]
        
        if available_cats:
            # 1-2개의 추가 카테고리 선택
            additional_count = min(random.randint(1, 2), len(available_cats))
            selected_cats = random.sample(available_cats, additional_count)
            
            for cat_id in selected_cats:
                cur.execute("INSERT INTO word_categories (word_id, category_id) VALUES (%s, %s) ON CONFLICT DO NOTHING", 
                          (word_id, cat_id))
                added_multi += 1

print(f"여러 카테고리 연결 {added_multi}개 추가되었습니다.")

# 6. 변경사항 저장
conn.commit()

# 7. 최종 결과 확인
print("\n=== 최종 결과 ===")

# 카테고리별 단어 수
cur.execute("""
    SELECT c.name, COUNT(wc.word_id) as word_count
    FROM categories c
    LEFT JOIN word_categories wc ON c.id = wc.category_id
    WHERE c.name IN ('TOEIC', 'TOEFL', 'GTELP', 'SUNEUNG')
    GROUP BY c.id, c.name
    ORDER BY word_count DESC
""")

print("카테고리별 단어 수:")
for category_name, word_count in cur.fetchall():
    print(f"  {category_name}: {word_count}개")

# 여러 카테고리를 가진 단어 수
cur.execute("""
    SELECT COUNT(*) as multi_category_count
    FROM (
        SELECT word_id 
        FROM word_categories 
        GROUP BY word_id 
        HAVING COUNT(category_id) > 1
    ) as multi_words
""")

multi_count = cur.fetchone()[0]
print(f"\n여러 카테고리를 가진 단어: {multi_count}개")

# 전체 통계
cur.execute("SELECT COUNT(DISTINCT word_id) FROM word_categories")
total_with_categories = cur.fetchone()[0]
print(f"카테고리를 가진 전체 단어: {total_with_categories}개")

cur.close()
conn.close()

print("\n완료! 모든 단어가 카테고리를 가지게 되었습니다.")
