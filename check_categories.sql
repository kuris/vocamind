-- 현재 카테고리 상태 확인
SELECT * FROM categories ORDER BY id;

-- 중복 카테고리가 있는지 확인  
SELECT name, COUNT(*) as count 
FROM categories 
WHERE LOWER(name) IN ('toeic', 'toefl', 'suneung', 'gongmuwon', 'gtelp')
GROUP BY name
ORDER BY name;

-- 참고: 중복이 발견되면 cleanup_duplicate_categories.sql을 먼저 실행하세요
