-- ID 2번 단어 확인 및 수정 스크립트

-- 현재 ID 2번 단어 확인
SELECT id, english, korean, category FROM words WHERE id = 2;

-- recognize가 있는 단어들 확인
SELECT id, english, korean, category FROM words WHERE english = 'recognize' LIMIT 5;

-- needle이 있는 단어들 확인  
SELECT id, english, korean, category FROM words WHERE english = 'needle' LIMIT 5;

-- 만약 ID 2번이 잘못되어 있다면 수정
-- UPDATE words SET english = 'needle' WHERE id = 2 AND english = 'recognize' AND korean = '바늘';

-- 또는 데이터를 완전히 교체
-- DELETE FROM words WHERE id = 2;
-- INSERT INTO words (id, english, korean, category) VALUES (2, 'needle', '바늘', 'toeic');
