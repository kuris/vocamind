-- 다중 카테고리 해시태그 설정
-- 일부 단어들을 여러 카테고리에 동시에 연결

-- 1. TOEIC과 TOEFL에 공통으로 나오는 단어들
INSERT INTO word_categories (word_id, category_id)
SELECT w.id, c.id
FROM words w
CROSS JOIN categories c
WHERE w.english IN (
  'provide', 'recognize', 'updated', 'regulation', 'precisely', 
  'perspective', 'honor', 'realize', 'accommodation', 'accurate',
  'equipment', 'experience', 'additional', 'complete', 'maintain',
  'organize', 'manage', 'schedule', 'available', 'appropriate'
)
AND w.category = 'toeic'
AND c.name = 'toefl'
AND NOT EXISTS (
  SELECT 1 FROM word_categories wc 
  WHERE wc.word_id = w.id AND wc.category_id = c.id
);

-- 2. TOEIC과 수능에 공통으로 나오는 단어들  
INSERT INTO word_categories (word_id, category_id)
SELECT w.id, c.id
FROM words w
CROSS JOIN categories c
WHERE w.english IN (
  'recognize', 'provide', 'regulation', 'perspective', 'realize',
  'experience', 'complete', 'maintain', 'organize', 'manage',
  'appropriate', 'equipment', 'available', 'accurate', 'schedule'
)
AND w.category = 'toeic' 
AND c.name = 'suneung'
AND NOT EXISTS (
  SELECT 1 FROM word_categories wc 
  WHERE wc.word_id = w.id AND wc.category_id = c.id
);

-- 3. TOEFL과 수능에 공통으로 나오는 단어들
INSERT INTO word_categories (word_id, category_id)
SELECT w.id, c.id
FROM words w
CROSS JOIN categories c
WHERE w.english IN (
  'provide', 'experience', 'complete', 'appropriate', 'available',
  'equipment', 'maintain', 'accurate', 'organize', 'schedule'
)
AND w.category = 'toefl'
AND c.name = 'suneung' 
AND NOT EXISTS (
  SELECT 1 FROM word_categories wc 
  WHERE wc.word_id = w.id AND wc.category_id = c.id
);

-- 4. 공무원 시험에도 나오는 기본 단어들
INSERT INTO word_categories (word_id, category_id)
SELECT w.id, c.id
FROM words w
CROSS JOIN categories c
WHERE w.english IN (
  'provide', 'complete', 'appropriate', 'available', 'maintain',
  'organize', 'manage', 'accurate', 'equipment'
)
AND w.category IN ('toeic', 'toefl', 'suneung')
AND c.name = 'gongmuwon'
AND NOT EXISTS (
  SELECT 1 FROM word_categories wc 
  WHERE wc.word_id = w.id AND wc.category_id = c.id
);

-- 5. 결과 확인 - 다중 해시태그를 가진 단어들
SELECT w.english, w.korean, w.category as main_category,
       ARRAY_AGG(c.name ORDER BY c.name) as hashtags,
       COUNT(c.name) as hashtag_count
FROM words w
JOIN word_categories wc ON w.id = wc.word_id
JOIN categories c ON wc.category_id = c.id
GROUP BY w.id, w.english, w.korean, w.category
HAVING COUNT(c.name) > 1
ORDER BY hashtag_count DESC, w.english
LIMIT 20;

-- 6. 전체 해시태그 통계
SELECT c.name, COUNT(*) as word_count
FROM word_categories wc
JOIN categories c ON wc.category_id = c.id
GROUP BY c.name
ORDER BY c.name;
