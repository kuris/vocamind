-- 해시태그(다중 카테고리) 데이터 추가

-- ========================================
-- 1. 현재 상태 확인
-- ========================================

-- categories 테이블 확인
SELECT * FROM categories ORDER BY id;

-- word_categories 테이블 확인 (TOEIC 관련)
SELECT wc.word_id, wc.category_id, c.name as category_name, w.english
FROM word_categories wc
JOIN categories c ON wc.category_id = c.id
JOIN words w ON wc.word_id = w.id
WHERE c.name = 'toeic'
LIMIT 10;

-- ========================================
-- 2. 카테고리가 없다면 생성
-- ========================================

-- 필요한 카테고리들 생성 (이미 있다면 무시)
INSERT INTO categories (name) 
SELECT 'toeic' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'toeic')
UNION ALL
SELECT 'toefl' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'toefl')
UNION ALL
SELECT 'suneung' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'suneung')
UNION ALL
SELECT 'gongmuwon' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'gongmuwon')
UNION ALL
SELECT 'gtelp' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'gtelp');

-- ========================================
-- 3. TOEIC 단어들에 해시태그 추가
-- ========================================

-- TOEIC 카테고리 ID 찾기
SELECT id FROM categories WHERE name = 'toeic';

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

-- ========================================
-- 4. 다른 카테고리들도 동일하게 처리
-- ========================================

-- TOEFL
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

-- 수능
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

-- 공무원
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

-- GTELP
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

-- ========================================
-- 5. 결과 확인
-- ========================================

-- 각 카테고리별 해시태그 연결 개수 확인
SELECT c.name, COUNT(*) as word_count
FROM word_categories wc
JOIN categories c ON wc.category_id = c.id
GROUP BY c.name
ORDER BY c.name;

-- TOEIC 단어 몇 개의 해시태그 확인
SELECT w.english, w.korean, ARRAY_AGG(c.name) as hashtags
FROM words w
JOIN word_categories wc ON w.id = wc.word_id
JOIN categories c ON wc.category_id = c.id
WHERE w.category = 'toeic'
GROUP BY w.id, w.english, w.korean
LIMIT 5;
