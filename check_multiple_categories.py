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

print("=== 여러 카테고리를 가진 단어들 확인 ===")

# 여러 카테고리를 가진 단어들 확인
cur.execute('''
    SELECT word_id, COUNT(category_id) as category_count 
    FROM word_categories 
    GROUP BY word_id 
    HAVING COUNT(category_id) > 1 
    ORDER BY category_count DESC 
    LIMIT 20
''')

result = cur.fetchall()
print(f'여러 카테고리를 가진 단어들 ({len(result)}개):')

if result:
    for word_id, count in result:
        cur.execute('SELECT english FROM words WHERE id = %s', (word_id,))
        english = cur.fetchone()
        if english:
            cur.execute('''
                SELECT c.name 
                FROM categories c 
                JOIN word_categories wc ON c.id = wc.category_id 
                WHERE wc.word_id = %s
            ''', (word_id,))
            categories = [row[0] for row in cur.fetchall()]
            print(f'  {english[0]} (ID: {word_id}): {count}개 카테고리 {categories}')
else:
    print('  여러 카테고리를 가진 단어가 없습니다.')

# 전체 통계
print("\n=== 전체 통계 ===")
cur.execute('SELECT COUNT(DISTINCT word_id) FROM word_categories')
total_words_with_categories = cur.fetchone()[0]

cur.execute('SELECT COUNT(*) FROM word_categories')
total_relationships = cur.fetchone()[0]

cur.execute('SELECT COUNT(*) FROM words')
total_words = cur.fetchone()[0]

print(f'전체 단어 수: {total_words}')
print(f'카테고리를 가진 단어 수: {total_words_with_categories}')
print(f'전체 단어-카테고리 관계 수: {total_relationships}')
print(f'평균 카테고리 수: {total_relationships / total_words_with_categories:.2f}')

# 카테고리별 단어 수
print("\n=== 카테고리별 단어 수 ===")
cur.execute('''
    SELECT c.name, COUNT(wc.word_id) as word_count
    FROM categories c
    LEFT JOIN word_categories wc ON c.id = wc.category_id
    GROUP BY c.id, c.name
    ORDER BY word_count DESC
''')

category_stats = cur.fetchall()
for category_name, word_count in category_stats:
    print(f'  {category_name}: {word_count}개 단어')

cur.close()
conn.close()
