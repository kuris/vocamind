-- TOEIC 단어들을 TOEIC 카테고리에 연결
INSERT INTO word_categories (word_id, category_id)
SELECT w.id, c.id
FROM words w
CROSS JOIN categories c
WHERE w.category = 'toeic' 
  AND c.name = 'toeic'
  AND NOT EXISTS (
    SELECT 1 FROM word_categories wc 
    WHERE wc.word_id = w.id AND wc.category_id = c.id
  );

-- TOEFL 단어들을 TOEFL 카테고리에 연결  
INSERT INTO word_categories (word_id, category_id)
SELECT w.id, c.id
FROM words w
CROSS JOIN categories c
WHERE w.category = 'toefl' 
  AND c.name = 'toefl'
  AND NOT EXISTS (
    SELECT 1 FROM word_categories wc 
    WHERE wc.word_id = w.id AND wc.category_id = c.id
  );

-- 수능 단어들을 수능 카테고리에 연결
INSERT INTO word_categories (word_id, category_id)
SELECT w.id, c.id
FROM words w
CROSS JOIN categories c
WHERE w.category = 'suneung' 
  AND c.name = 'suneung'
  AND NOT EXISTS (
    SELECT 1 FROM word_categories wc 
    WHERE wc.word_id = w.id AND wc.category_id = c.id
  );

-- 공무원 단어들을 공무원 카테고리에 연결
INSERT INTO word_categories (word_id, category_id)
SELECT w.id, c.id
FROM words w
CROSS JOIN categories c
WHERE w.category = 'gongmuwon' 
  AND c.name = 'gongmuwon'
  AND NOT EXISTS (
    SELECT 1 FROM word_categories wc 
    WHERE wc.word_id = w.id AND wc.category_id = c.id
  );

-- GTELP 단어들을 GTELP 카테고리에 연결
INSERT INTO word_categories (word_id, category_id)
SELECT w.id, c.id
FROM words w
CROSS JOIN categories c
WHERE w.category = 'gtelp' 
  AND c.name = 'gtelp'
  AND NOT EXISTS (
    SELECT 1 FROM word_categories wc 
    WHERE wc.word_id = w.id AND wc.category_id = c.id
  );

-- 결과 확인
SELECT c.name, COUNT(*) as word_count
FROM word_categories wc
JOIN categories c ON wc.category_id = c.id
GROUP BY c.name
ORDER BY c.name;
