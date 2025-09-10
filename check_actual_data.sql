-- 실제 데이터 확인
-- 1. 각 카테고리별 단어 개수
SELECT category, COUNT(*) as word_count
FROM words 
WHERE category IN ('toeic', 'toefl', 'suneung', 'gongmuwon', 'gtelp')
GROUP BY category
ORDER BY category;

-- 2. 실제로 여러 카테고리에 중복되는 영어 단어가 있는지 확인
SELECT english, 
       COUNT(DISTINCT category) as category_count,
       ARRAY_AGG(DISTINCT category ORDER BY category) as categories,
       COUNT(*) as total_records
FROM words 
WHERE category IN ('toeic', 'toefl', 'suneung', 'gongmuwon', 'gtelp')
GROUP BY english
HAVING COUNT(DISTINCT category) > 1
ORDER BY category_count DESC, english
LIMIT 10;

-- 3. 만약 중복이 없다면, 각 카테고리의 샘플 단어들 확인
SELECT category, english, korean
FROM words 
WHERE category IN ('toeic', 'toefl', 'suneung', 'gongmuwon', 'gtelp')
ORDER BY category, id
LIMIT 20;
