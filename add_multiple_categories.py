import psycopg2
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

# 카테고리 ID 매핑 가져오기
cur.execute("SELECT id, name FROM categories")
categories = dict(cur.fetchall())
print("Available categories:", categories)

# 중요한 단어들을 여러 카테고리에 연결할 규칙 정의
important_word_rules = [
    # 기본적인 학술/비즈니스 단어들 - TOEIC, TOEFL 공통
    {
        "keywords": ["important", "significant", "essential", "crucial", "critical", "vital", "fundamental", "basic", "primary", "main", "major", "key", "principal"],
        "categories": ["TOEIC", "TOEFL"]
    },
    # 분석/연구 관련 - TOEFL, GTELP 공통
    {
        "keywords": ["analyze", "analysis", "research", "study", "investigate", "examine", "evaluate", "assess", "review", "consider"],
        "categories": ["TOEFL", "GTELP"]
    },
    # 비즈니스/경제 관련 - TOEIC, GTELP 공통
    {
        "keywords": ["business", "economy", "economic", "financial", "profit", "revenue", "budget", "investment", "market", "commercial"],
        "categories": ["TOEIC", "GTELP"]
    },
    # 교육/학습 관련 - TOEFL, SUNEUNG 공통
    {
        "keywords": ["education", "educational", "learn", "learning", "teach", "teaching", "student", "academic", "university", "college"],
        "categories": ["TOEFL", "SUNEUNG"]
    },
    # 과학/기술 관련 - TOEFL, GTELP, SUNEUNG 공통
    {
        "keywords": ["science", "scientific", "technology", "technical", "research", "development", "innovation", "experiment", "theory", "method"],
        "categories": ["TOEFL", "GTELP", "SUNEUNG"]
    },
    # 사회/문화 관련 - 모든 카테고리 공통
    {
        "keywords": ["society", "social", "culture", "cultural", "community", "public", "government", "policy", "international", "global"],
        "categories": ["TOEIC", "TOEFL", "GTELP", "SUNEUNG"]
    },
    # 커뮤니케이션 관련 - TOEIC, TOEFL 공통
    {
        "keywords": ["communicate", "communication", "discuss", "discussion", "meeting", "presentation", "report", "information", "data"],
        "categories": ["TOEIC", "TOEFL"]
    }
]

def add_word_to_multiple_categories(word_id, category_names):
    """단어를 여러 카테고리에 추가"""
    added_count = 0
    for cat_name in category_names:
        # 카테고리 ID 찾기
        cat_id = None
        for cid, cname in categories.items():
            if cname == cat_name:
                cat_id = cid
                break
        
        if cat_id:
            try:
                # 이미 존재하는지 확인
                cur.execute("SELECT COUNT(*) FROM word_categories WHERE word_id = %s AND category_id = %s", (word_id, cat_id))
                if cur.fetchone()[0] == 0:
                    # 존재하지 않으면 추가
                    cur.execute("INSERT INTO word_categories (word_id, category_id) VALUES (%s, %s)", (word_id, cat_id))
                    added_count += 1
                    print(f"  Added word {word_id} to category {cat_name}")
            except Exception as e:
                print(f"  Error adding word {word_id} to category {cat_name}: {e}")
    
    return added_count

# 각 규칙에 따라 단어들을 여러 카테고리에 연결
total_added = 0

for rule in important_word_rules:
    print(f"\nProcessing rule for categories {rule['categories']}...")
    
    for keyword in rule["keywords"]:
        # 키워드가 포함된 단어들 찾기 (english 컬럼에서)
        cur.execute("SELECT id, english FROM words WHERE LOWER(english) LIKE %s", (f"%{keyword.lower()}%",))
        matching_words = cur.fetchall()
        
        print(f"  Keyword '{keyword}': found {len(matching_words)} matching words")
        
        for word_id, english in matching_words:
            added = add_word_to_multiple_categories(word_id, rule["categories"])
            total_added += added

# 추가로, 자주 사용되는 동사들을 TOEIC, TOEFL에 공통으로 추가
common_verbs = [
    "make", "take", "get", "give", "go", "come", "see", "know", "think", "say", "tell", "ask",
    "use", "work", "try", "call", "need", "feel", "become", "leave", "put", "mean", "keep",
    "let", "begin", "seem", "help", "show", "hear", "play", "run", "move", "live", "believe",
    "bring", "happen", "write", "provide", "sit", "stand", "lose", "pay", "meet", "include"
]

print(f"\nProcessing common verbs for TOEIC and TOEFL...")
for verb in common_verbs:
    cur.execute("SELECT id, english FROM words WHERE LOWER(english) = %s", (verb.lower(),))
    matching_words = cur.fetchall()
    
    for word_id, english in matching_words:
        added = add_word_to_multiple_categories(word_id, ["TOEIC", "TOEFL"])
        total_added += added
        if added > 0:
            print(f"  Added common verb '{english}' to TOEIC and TOEFL")

# 변경사항 저장
conn.commit()
cur.close()
conn.close()

print(f"\n완료! 총 {total_added}개의 단어-카테고리 연결을 추가했습니다.")
print("이제 중요한 단어들이 여러 해시태그를 가지게 됩니다.")
