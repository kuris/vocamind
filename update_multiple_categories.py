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

# 카테고리 ID 매핑 가져오기
cur.execute("SELECT id, name FROM categories")
categories = dict(cur.fetchall())
print("Available categories:", categories)

# 카테고리 ID를 name으로 매핑
category_name_to_id = {name: id for id, name in categories.items()}

# 중요한 단어들을 여러 카테고리에 연결할 규칙 정의
important_words_multi_category = [
    # 비즈니스/학술 공통 단어들 - TOEIC + TOEFL
    {
        "keywords": ["important", "significant", "essential", "analysis", "research", "development", "management", "organization", "professional", "effective"],
        "categories": ["TOEIC", "TOEFL"]
    },
    # 과학/기술 단어들 - TOEFL + GTELP + SUNEUNG
    {
        "keywords": ["science", "technology", "method", "system", "process", "theory", "experiment", "research"],
        "categories": ["TOEFL", "GTELP", "SUNEUNG"]
    },
    # 교육/학습 관련 - TOEFL + SUNEUNG
    {
        "keywords": ["education", "study", "learn", "knowledge", "academic", "university", "student", "teach"],
        "categories": ["TOEFL", "SUNEUNG"]
    },
    # 경제/비즈니스 - TOEIC + GTELP
    {
        "keywords": ["business", "economic", "financial", "market", "profit", "investment", "revenue", "budget"],
        "categories": ["TOEIC", "GTELP"]
    },
    # 사회/문화 - 모든 카테고리
    {
        "keywords": ["society", "culture", "community", "public", "government", "international", "global", "social"],
        "categories": ["TOEIC", "TOEFL", "GTELP", "SUNEUNG"]
    },
    # 기본 동사들 - TOEIC + TOEFL + GTELP
    {
        "keywords": ["provide", "include", "require", "consider", "develop", "create", "maintain", "establish", "achieve", "determine"],
        "categories": ["TOEIC", "TOEFL", "GTELP"]
    }
]

# 랜덤으로 단어들을 여러 카테고리에 연결
def randomly_assign_multiple_categories():
    """랜덤하게 선택된 단어들을 여러 카테고리에 연결"""
    
    # 각 카테고리별로 상위 단어들 선택
    categories_list = ['TOEIC', 'TOEFL', 'GTELP', 'SUNEUNG']
    
    for primary_cat in categories_list:
        print(f"\n=== Processing {primary_cat} words ===")
        
        # 해당 카테고리의 단어들 가져오기
        primary_cat_id = category_name_to_id[primary_cat]
        cur.execute("""
            SELECT w.id, w.english 
            FROM words w 
            JOIN word_categories wc ON w.id = wc.word_id 
            WHERE wc.category_id = %s 
            ORDER BY RANDOM() 
            LIMIT 50
        """, (primary_cat_id,))
        
        words_in_category = cur.fetchall()
        print(f"Found {len(words_in_category)} words in {primary_cat}")
        
        # 각 단어를 1-2개의 추가 카테고리에 연결
        for word_id, english in words_in_category:
            # 현재 단어가 속한 카테고리들 확인
            cur.execute("SELECT category_id FROM word_categories WHERE word_id = %s", (word_id,))
            current_categories = [row[0] for row in cur.fetchall()]
            
            # 추가할 카테고리 개수 결정 (30% 확률로 2개, 70% 확률로 1개)
            additional_count = 2 if random.random() < 0.3 else 1
            
            # 아직 연결되지 않은 카테고리들 중에서 선택
            available_categories = [cat for cat in categories_list if category_name_to_id[cat] not in current_categories]
            
            if available_categories:
                # 랜덤하게 추가 카테고리 선택
                additional_categories = random.sample(available_categories, min(additional_count, len(available_categories)))
                
                for add_cat in additional_categories:
                    add_cat_id = category_name_to_id[add_cat]
                    try:
                        cur.execute("INSERT INTO word_categories (word_id, category_id) VALUES (%s, %s) ON CONFLICT DO NOTHING", 
                                  (word_id, add_cat_id))
                        print(f"  Added '{english}' to {add_cat}")
                    except Exception as e:
                        print(f"  Error adding '{english}' to {add_cat}: {e}")

def add_words_by_keywords():
    """키워드 기반으로 단어들을 여러 카테고리에 연결"""
    
    total_added = 0
    
    for rule in important_words_multi_category:
        print(f"\n=== Processing keywords for categories {rule['categories']} ===")
        
        for keyword in rule["keywords"]:
            # 키워드가 포함된 단어들 찾기
            cur.execute("SELECT id, english FROM words WHERE LOWER(english) LIKE %s", (f"%{keyword.lower()}%",))
            matching_words = cur.fetchall()
            
            if matching_words:
                print(f"  Keyword '{keyword}': found {len(matching_words)} matching words")
                
                for word_id, english in matching_words:
                    # 현재 단어의 카테고리 확인
                    cur.execute("SELECT category_id FROM word_categories WHERE word_id = %s", (word_id,))
                    current_categories = [row[0] for row in cur.fetchall()]
                    
                    # 규칙에 있는 카테고리들 중 아직 연결되지 않은 것들 추가
                    for cat_name in rule["categories"]:
                        cat_id = category_name_to_id[cat_name]
                        if cat_id not in current_categories:
                            try:
                                cur.execute("INSERT INTO word_categories (word_id, category_id) VALUES (%s, %s) ON CONFLICT DO NOTHING", 
                                          (word_id, cat_id))
                                total_added += 1
                                print(f"    Added '{english}' to {cat_name}")
                            except Exception as e:
                                print(f"    Error adding '{english}' to {cat_name}: {e}")
    
    return total_added

# 실행
print("1. 키워드 기반으로 중요한 단어들을 여러 카테고리에 연결...")
keyword_added = add_words_by_keywords()

print("\n2. 랜덤하게 단어들을 여러 카테고리에 연결...")
randomly_assign_multiple_categories()

# 변경사항 저장
conn.commit()

# 결과 확인
cur.execute("""
    SELECT word_id, COUNT(category_id) as category_count 
    FROM word_categories 
    GROUP BY word_id 
    HAVING COUNT(category_id) > 1 
    ORDER BY category_count DESC 
    LIMIT 10
""")

multi_category_words = cur.fetchall()
print(f"\n=== 결과 ===")
print(f"키워드 기반으로 {keyword_added}개의 연결을 추가했습니다.")
print(f"여러 카테고리를 가진 단어들 (상위 10개):")

for word_id, count in multi_category_words:
    cur.execute("SELECT english FROM words WHERE id = %s", (word_id,))
    english = cur.fetchone()
    if english:
        # 해당 단어의 카테고리들 확인
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

print("\n완료! 이제 프론트엔드에서 여러 해시태그를 확인해보세요.")
