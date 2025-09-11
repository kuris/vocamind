-- 모든 카테고리의 해시태그 완전 복구 스크립트

-- 1. 현재 상태 확인
SELECT 
  w.category,
  COUNT(*) as total_words,
  COUNT(wh.english) as words_with_hashtags,
  COUNT(*) - COUNT(wh.english) as missing_hashtags
FROM words w
LEFT JOIN word_hashtags wh ON w.english = wh.english AND wh.hashtag = w.category
WHERE w.category IN ('toeic', 'toefl', 'suneung', 'gongmuwon', 'gtelp')
GROUP BY w.category
ORDER BY w.category;

-- 2. 모든 카테고리의 누락된 해시태그 추가
-- TOEIC
INSERT INTO word_hashtags (english, hashtag)
SELECT DISTINCT w.english, 'toeic'
FROM words w
LEFT JOIN word_hashtags wh ON w.english = wh.english AND wh.hashtag = 'toeic'
WHERE w.category = 'toeic' 
AND wh.english IS NULL
ON CONFLICT (english, hashtag) DO NOTHING;

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

-- 3. 결과 재확인
SELECT 
  w.category,
  COUNT(*) as total_words,
  COUNT(wh.english) as words_with_hashtags,
  COUNT(*) - COUNT(wh.english) as missing_hashtags
FROM words w
LEFT JOIN word_hashtags wh ON w.english = wh.english AND wh.hashtag = w.category
WHERE w.category IN ('toeic', 'toefl', 'suneung', 'gongmuwon', 'gtelp')
GROUP BY w.category
ORDER BY w.category;

-- 4. 전체 해시태그 통계
SELECT hashtag, COUNT(*) as word_count
FROM word_hashtags
GROUP BY hashtag
ORDER BY hashtag;

-- 5. 샘플 확인 - 각 카테고리에서 랜덤 3개씩
SELECT w.english, w.korean, w.category, 
       COALESCE(ARRAY_AGG(wh.hashtag ORDER BY wh.hashtag), ARRAY[]::VARCHAR[]) as hashtags
FROM words w
LEFT JOIN word_hashtags wh ON w.english = wh.english
WHERE w.category = 'toeic'
GROUP BY w.id, w.english, w.korean, w.category
ORDER BY RANDOM()
LIMIT 3;
