-- 카테고리 생성 (이미 있다면 무시)
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

-- 카테고리 확인
SELECT * FROM categories ORDER BY id;
