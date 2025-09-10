-- TOEIC 다중 카테고리 시스템용 완전 복원 스크립트

-- ========================================
-- 1. 기존 TOEIC 데이터 완전 삭제
-- ========================================

-- TOEIC 카테고리 ID 찾기
SELECT id, name FROM categories WHERE name = 'toeic';

-- word_categories에서 TOEIC 관계 삭제
DELETE FROM word_categories 
WHERE category_id = (SELECT id FROM categories WHERE name = 'toeic');

-- words 테이블에서 TOEIC 데이터 삭제  
DELETE FROM words 
WHERE id IN (
  SELECT DISTINCT wc.word_id 
  FROM word_categories wc 
  JOIN categories c ON wc.category_id = c.id 
  WHERE c.name = 'toeic'
);

-- ========================================
-- 2. TOEIC 카테고리 확인/생성
-- ========================================

-- TOEIC 카테고리가 있는지 확인
SELECT id FROM categories WHERE name = 'toeic';

-- 없으면 생성 (필요시)
-- INSERT INTO categories (name) VALUES ('toeic');

-- ========================================
-- 3. TOEIC 단어 INSERT (다중 카테고리 시스템용)
-- ========================================

-- 단어 INSERT 후 카테고리 연결까지 한 번에 처리하는 방법

WITH inserted_words AS (
  INSERT INTO words (english, korean) VALUES
  ('knowledgeable', 'ad . ( 사람 수식 ) 아는 것이 많은 . 잘 아는'),
  ('recognize', 'v . ( 공로 를 ) 인정 하다 : 알아 보다'),
  ('updated', 'adj . 최신 의'),
  ('provide', 'v . 제공 하다 . 주다'),
  ('regulation', 'n . 규제'),
  ('precisely', 'adv . 정확히'),
  ('perspective', 'n . 관점'),
  ('knowledgeably', 'adv . 박식 하게'),
  ('knowledge', 'n . 지식 ( 불가 산 명사 ) : 이해 ( 가산 명사 )'),
  ('honor', '명예 를 주다'),
  ('realize', '인식 하다 확실히 이해 하다'),
  ('recognition', 'n . 알아 봄'),
  ('recognizable', 'adj . 인식 할 수 있는'),
  ('be recognized for', '~로 인정 받다'),
  ('be credited with', '~로 인정 받다')
  -- 나머지 단어들...
  RETURNING id, english
)
INSERT INTO word_categories (word_id, category_id)
SELECT iw.id, c.id
FROM inserted_words iw
CROSS JOIN categories c
WHERE c.name = 'toeic';

-- ========================================
-- 4. 간단한 방법: 기존 데이터 수정
-- ========================================

-- 또는 현재 잘못된 데이터만 수정
UPDATE words 
SET english = 'provide', korean = 'v . 제공 하다 . 주다'
WHERE id IN (
  SELECT w.id 
  FROM words w
  JOIN word_categories wc ON w.id = wc.word_id
  JOIN categories c ON wc.category_id = c.id
  WHERE c.name = 'toeic' AND w.english = 'distribute'
);

UPDATE words 
SET english = 'distribute', korean = 'v . 분배하다, 배포하다'  
WHERE id IN (
  SELECT w.id 
  FROM words w
  JOIN word_categories wc ON w.id = wc.word_id
  JOIN categories c ON wc.category_id = c.id
  WHERE c.name = 'toeic' AND w.korean LIKE '%제공%'
);

-- ========================================
-- 5. 확인 쿼리
-- ========================================

-- TOEIC 단어들 확인
SELECT w.id, w.english, w.korean
FROM words w
JOIN word_categories wc ON w.id = wc.word_id
JOIN categories c ON wc.category_id = c.id
WHERE c.name = 'toeic'
ORDER BY w.id
LIMIT 10;
