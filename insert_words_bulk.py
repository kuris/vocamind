import psycopg2
import os

category_files = [
    "toeicword.csv",
    "toeflword.csv",
    "gtelpword.csv",
    "suneungword.csv",
    "gongmuwonword.csv"
]

conn = psycopg2.connect(
    host="aws-1-ap-northeast-2.pooler.supabase.com",
    port=6543,
    dbname="postgres",
    user="postgres.ggtydikxkfozlhnihrwr",
    password="76017602Ab!"
)
cur = conn.cursor()

inserted = 0
words_set = set()

for filename in category_files:
    print(f"[시작] {filename} 파일 처리 중...")
    if os.path.exists(filename):
        with open(filename, encoding="utf-8") as f:
            file_inserted = 0
            for i, line in enumerate(f):
                if i == 0:


                    import psycopg2
                    import os

                    category_files = [
                        "toeicword.csv",
                        "toeflword.csv",
                        "gtelpword.csv",
                        "suneungword.csv",
                        "gongmuwonword.csv"
                    ]

                    conn = psycopg2.connect(
                        host="aws-1-ap-northeast-2.pooler.supabase.com",
                        port=6543,
                        dbname="postgres",
                        user="postgres.ggtydikxkfozlhnihrwr",
                        password="76017602Ab!"
                    )
                    cur = conn.cursor()

                    # 1. DB에서 korean 컬럼이 비어 있는 id 전체 추출
                    cur.execute("SELECT id FROM words WHERE korean IS NULL OR TRIM(korean) = '' ORDER BY id;")
                    empty_ids = [row[0] for row in cur.fetchall()]


                    # 2. 5개 CSV에서 모든 단어(영어, 한글)를 순서대로 읽어오기
                    words = []
                    for filename in category_files:
                        if os.path.exists(filename):
                            with open(filename, encoding="utf-8") as f:
                                for i, line in enumerate(f):
                                    if i == 0:
                                        continue  # 헤더 건너뛰기
                                    parts = line.strip().split(',')
                                    english = parts[0].strip() if len(parts) > 0 else ''
                                    korean = parts[1].strip() if len(parts) > 1 else ''
                                    if english:
                                        words.append((english, korean))
                        else:
                            print(f"[경고] {filename} 파일이 존재하지 않습니다.")

                    # 3. 비어 있는 id와 단어를 매칭해서 업데이트 (최소값 기준)
                    for word_id, (english, korean) in zip(empty_ids, words):
                        cur.execute(
                            "UPDATE words SET word = %s, english = %s, korean = %s WHERE id = %s;",
                            (english, english, korean, word_id)
                        )

                    conn.commit()
                    cur.close()
                    conn.close()
                    print(f"총 {min(len(empty_ids), len(words))}개 단어가 비어 있던 id에 업데이트되었습니다.")
