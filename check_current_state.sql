-- 현재 데이터베이스 상태 확인 쿼리

-- 1. TOEIC 카테고리 총 단어 개수 확인
SELECT COUNT(*) as total_toeic_words 
FROM words 
WHERE category = 'toeic';

-- 2. recognize 단어 현재 상태 확인
SELECT id, english, korean, category 
FROM words 
WHERE english = 'recognize' 
  AND category = 'toeic';

-- 3. ID 2번 단어 현재 상태 확인
SELECT id, english, korean, category 
FROM words 
WHERE id = 2;

-- 4. 첫 10개 TOEIC 단어 확인
SELECT id, english, korean 
FROM words 
WHERE category = 'toeic' 
ORDER BY id 
LIMIT 10;

-- 5. needle 단어 확인
SELECT id, english, korean, category 
FROM words 
WHERE english = 'needle' 
  OR korean LIKE '%바늘%';

-- 6. 최근 생성된 TOEIC 단어들 확인 (방금 INSERT한 것들)
SELECT id, english, korean, created_at 
FROM words 
WHERE category = 'toeic' 
ORDER BY id DESC 
LIMIT 10;
