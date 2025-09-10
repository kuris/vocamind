-- 실제 데이터 기반 다중 해시태그 자동 생성
-- 동일한 영어 단어가 여러 카테고리에 존재하는 경우 자동으로 연결

-- 1. 먼저 중복되는 영어 단어들 확인
SELECT english, 
       COUNT(DISTINCT category) as category_count,
       ARRAY_AGG(DISTINCT category ORDER BY category) as categories
FROM words 
WHERE category IN ('toeic', 'toefl', 'suneung', 'gongmuwon', 'gtelp')
GROUP BY english
HAVING COUNT(DISTINCT category) > 1
ORDER BY category_count DESC, english
LIMIT 20;

-- 2. 동일한 영어 단어가 여러 카테고리에 있는 경우, 
--    모든 해당 카테고리에 연결
INSERT INTO word_categories (word_id, category_id)
SELECT DISTINCT w1.id, c.id
FROM words w1
JOIN (
  -- 중복되는 영어 단어들 찾기
  SELECT english
  FROM words 
  WHERE category IN ('toeic', 'toefl', 'suneung', 'gongmuwon', 'gtelp')
  GROUP BY english
  HAVING COUNT(DISTINCT category) > 1
) duplicates ON w1.english = duplicates.english
JOIN words w2 ON w1.english = w2.english AND w1.id != w2.id
JOIN categories c ON c.name = w2.category
WHERE w1.category IN ('toeic', 'toefl', 'suneung', 'gongmuwon', 'gtelp')
AND c.name IN ('toeic', 'toefl', 'suneung', 'gongmuwon', 'gtelp')
AND NOT EXISTS (
  SELECT 1 FROM word_categories wc 
  WHERE wc.word_id = w1.id AND wc.category_id = c.id
);

-- 3. 결과 확인 - 다중 해시태그를 가진 단어들
SELECT w.english, w.korean, w.category as main_category,
       ARRAY_AGG(c.name ORDER BY c.name) as hashtags,
       COUNT(c.name) as hashtag_count
FROM words w
JOIN word_categories wc ON w.id = wc.word_id
JOIN categories c ON wc.category_id = c.id
GROUP BY w.id, w.english, w.korean, w.category
HAVING COUNT(c.name) > 1
ORDER BY hashtag_count DESC, w.english
LIMIT 30;

-- 4. 전체 통계
SELECT c.name, COUNT(*) as word_count
FROM word_categories wc
JOIN categories c ON wc.category_id = c.id
GROUP BY c.name
ORDER BY c.name;
