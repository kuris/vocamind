-- 해시태그가 누락된 단어들 확인 및 수정

-- 1. TOEIC 카테고리에 있지만 해시태그가 없는 단어들 확인
SELECT w.english, w.korean, w.category
FROM words w
LEFT JOIN word_hashtags wh ON w.english = wh.english AND wh.hashtag = 'toeic'
WHERE w.category = 'toeic' 
AND wh.english IS NULL
ORDER BY w.english
LIMIT 20;

-- 2. 누락된 TOEIC 단어들에 해시태그 추가
INSERT INTO word_hashtags (english, hashtag)
SELECT DISTINCT w.english, 'toeic'
FROM words w
LEFT JOIN word_hashtags wh ON w.english = wh.english AND wh.hashtag = 'toeic'
WHERE w.category = 'toeic' 
AND wh.english IS NULL
ON CONFLICT (english, hashtag) DO NOTHING;

-- 3. 다른 카테고리들도 동일하게 처리
-- TOEFL
INSERT INTO word_hashtags (english, hashtag)
SELECT DISTINCT w.english, 'toefl'
FROM words w
LEFT JOIN word_hashtags wh ON w.english = wh.english AND wh.hashtag = 'toefl'
WHERE w.category = 'toefl' 
AND wh.english IS NULL
ON CONFLICT (english, hashtag) DO NOTHING;

-- 수능
INSERT INTO word_hashtags (english, hashtag)
SELECT DISTINCT w.english, 'suneung'
FROM words w
LEFT JOIN word_hashtags wh ON w.english = wh.english AND wh.hashtag = 'suneung'
WHERE w.category = 'suneung' 
AND wh.english IS NULL
ON CONFLICT (english, hashtag) DO NOTHING;

-- 공무원
INSERT INTO word_hashtags (english, hashtag)
SELECT DISTINCT w.english, 'gongmuwon'
FROM words w
LEFT JOIN word_hashtags wh ON w.english = wh.english AND wh.hashtag = 'gongmuwon'
WHERE w.category = 'gongmuwon' 
AND wh.english IS NULL
ON CONFLICT (english, hashtag) DO NOTHING;

-- GTELP
INSERT INTO word_hashtags (english, hashtag)
SELECT DISTINCT w.english, 'gtelp'
FROM words w
LEFT JOIN word_hashtags wh ON w.english = wh.english AND wh.hashtag = 'gtelp'
WHERE w.category = 'gtelp' 
AND wh.english IS NULL
ON CONFLICT (english, hashtag) DO NOTHING;

-- 4. 결과 확인
SELECT hashtag, COUNT(*) as word_count
FROM word_hashtags
GROUP BY hashtag
ORDER BY hashtag;

-- 5. "As often happens" 단어 특별 확인
SELECT w.english, w.korean, w.category,
       COALESCE(ARRAY_AGG(wh.hashtag ORDER BY wh.hashtag), ARRAY[]::VARCHAR[]) as hashtags
FROM words w
LEFT JOIN word_hashtags wh ON w.english = wh.english
WHERE w.english = 'As often happens'
GROUP BY w.id, w.english, w.korean, w.category;
