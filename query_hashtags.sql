-- 해시태그 데이터 조회 쿼리들

-- 1. 전체 해시태그 테이블 상태 확인
SELECT * FROM word_hashtags ORDER BY english, hashtag LIMIT 20;

-- 2. 각 해시태그별 단어 개수
SELECT hashtag, COUNT(*) as word_count
FROM word_hashtags
GROUP BY hashtag
ORDER BY word_count DESC;

-- 3. 다중 해시태그를 가진 단어들 (2개 이상)
SELECT english, 
       ARRAY_AGG(hashtag ORDER BY hashtag) as hashtags,
       COUNT(*) as hashtag_count
FROM word_hashtags
GROUP BY english
HAVING COUNT(*) > 1
ORDER BY hashtag_count DESC, english
LIMIT 20;

-- 4. 특정 단어의 해시태그 조회 (예: recognize)
SELECT english, hashtag
FROM word_hashtags
WHERE english = 'recognize'
ORDER BY hashtag;

-- 5. 특정 해시태그의 단어들 조회 (예: toeic)
SELECT english, hashtag
FROM word_hashtags
WHERE hashtag = 'toeic'
ORDER BY english
LIMIT 20;

-- 6. 단어와 해시태그 조인 조회 (실제 프론트엔드에서 사용할 방식)
SELECT w.english, w.korean, w.category,
       COALESCE(ARRAY_AGG(wh.hashtag ORDER BY wh.hashtag), ARRAY[]::VARCHAR[]) as hashtags
FROM words w
LEFT JOIN word_hashtags wh ON w.english = wh.english
WHERE w.category = 'toeic'
GROUP BY w.id, w.english, w.korean, w.category
ORDER BY w.id
LIMIT 10;

-- 7. 해시태그가 없는 단어들 확인
SELECT w.english, w.korean, w.category
FROM words w
LEFT JOIN word_hashtags wh ON w.english = wh.english
WHERE wh.english IS NULL
AND w.category IN ('toeic', 'toefl', 'suneung', 'gongmuwon', 'gtelp')
LIMIT 10;

-- 8. 전체 통계
SELECT 
  (SELECT COUNT(DISTINCT english) FROM word_hashtags) as unique_words_with_hashtags,
  (SELECT COUNT(*) FROM word_hashtags) as total_hashtag_entries,
  (SELECT COUNT(DISTINCT english) FROM words WHERE category IN ('toeic', 'toefl', 'suneung', 'gongmuwon', 'gtelp')) as total_words_in_categories;

-- 9. 가장 많은 해시태그를 가진 단어들
SELECT english, 
       ARRAY_AGG(hashtag ORDER BY hashtag) as hashtags,
       COUNT(*) as hashtag_count
FROM word_hashtags
GROUP BY english
ORDER BY hashtag_count DESC, english
LIMIT 5;
