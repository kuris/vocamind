-- 해시태그 전용 테이블 생성 및 설정

-- 1. 해시태그 테이블 생성 (이미 있다면 무시)
CREATE TABLE IF NOT EXISTS word_hashtags (
  id SERIAL PRIMARY KEY,
  english VARCHAR(255) NOT NULL,
  hashtag VARCHAR(50) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(english, hashtag)
);

-- 기존 데이터 삭제 (재실행을 위해)
DELETE FROM word_hashtags;

-- 2. TOEIC 단어들에 #토익 해시태그 추가
INSERT INTO word_hashtags (english, hashtag)
SELECT DISTINCT english, 'toeic'
FROM words 
WHERE category = 'toeic'
ON CONFLICT (english, hashtag) DO NOTHING;

-- 3. TOEFL 단어들에 #토플 해시태그 추가  
INSERT INTO word_hashtags (english, hashtag)
SELECT DISTINCT english, 'toefl'
FROM words 
WHERE category = 'toefl'
ON CONFLICT (english, hashtag) DO NOTHING;

-- 4. 수능 단어들에 #수능 해시태그 추가
INSERT INTO word_hashtags (english, hashtag)
SELECT DISTINCT english, 'suneung'
FROM words 
WHERE category = 'suneung'
ON CONFLICT (english, hashtag) DO NOTHING;

-- 5. 공무원 단어들에 #공무원 해시태그 추가
INSERT INTO word_hashtags (english, hashtag)
SELECT DISTINCT english, 'gongmuwon'
FROM words 
WHERE category = 'gongmuwon'
ON CONFLICT (english, hashtag) DO NOTHING;

-- 6. GTELP 단어들에 #지텔프 해시태그 추가
INSERT INTO word_hashtags (english, hashtag)
SELECT DISTINCT english, 'gtelp'
FROM words 
WHERE category = 'gtelp'
ON CONFLICT (english, hashtag) DO NOTHING;

-- 7. 결과 확인
SELECT hashtag, COUNT(*) as word_count
FROM word_hashtags
GROUP BY hashtag
ORDER BY hashtag;

-- 8. 다중 해시태그를 가진 단어들 확인
SELECT english, 
       ARRAY_AGG(hashtag ORDER BY hashtag) as hashtags,
       COUNT(*) as hashtag_count
FROM word_hashtags
GROUP BY english
HAVING COUNT(*) > 1
ORDER BY hashtag_count DESC, english
LIMIT 10;

-- 9. 특정 단어의 해시태그 조회 예시 (recognize)
SELECT w.english, w.korean, w.category,
       COALESCE(ARRAY_AGG(wh.hashtag ORDER BY wh.hashtag), ARRAY[]::VARCHAR[]) as hashtags
FROM words w
LEFT JOIN word_hashtags wh ON w.english = wh.english
WHERE w.english = 'recognize'
GROUP BY w.id, w.english, w.korean, w.category;
