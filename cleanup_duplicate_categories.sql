-- 중복 카테고리 정리
-- 1. 먼저 기존 word_categories에서 대문자 카테고리를 사용하는 관계들을 소문자로 변경

-- TOEIC (id=1) -> toeic (id=8)로 변경
UPDATE word_categories 
SET category_id = 8 
WHERE category_id = 1;

-- TOEFL (id=2) -> toefl (id=9)로 변경  
UPDATE word_categories 
SET category_id = 9 
WHERE category_id = 2;

-- GTELP (id=3) -> gtelp (id=12)로 변경
UPDATE word_categories 
SET category_id = 12 
WHERE category_id = 3;

-- SUNEUNG (id=4) -> suneung (id=10)로 변경
UPDATE word_categories 
SET category_id = 10 
WHERE category_id = 4;

-- GONGMUWON (id=7) -> gongmuwon (id=11)로 변경
UPDATE word_categories 
SET category_id = 11 
WHERE category_id = 7;

-- 2. 중복된 대문자 카테고리들 삭제
DELETE FROM categories WHERE id IN (1, 2, 3, 4, 7);

-- 3. 결과 확인
SELECT * FROM categories ORDER BY id;

-- 4. word_categories 연결 상태 확인
SELECT c.name, COUNT(*) as word_count
FROM word_categories wc
JOIN categories c ON wc.category_id = c.id
GROUP BY c.name
ORDER BY c.name;
