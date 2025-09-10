-- 단어와 뜻이 뒤바뀐 문제들을 찾고 수정하는 쿼리

-- ========================================
-- 1. 잘못된 매칭 패턴 찾기
-- ========================================

-- provide가 "분배하다"로 되어 있는 경우 찾기
SELECT id, english, korean 
FROM words 
WHERE english = 'provide' 
  AND korean LIKE '%분배%';

-- distribute가 "제공하다"로 되어 있는 경우 찾기  
SELECT id, english, korean 
FROM words 
WHERE english = 'distribute' 
  AND (korean LIKE '%제공%' OR korean LIKE '%주다%');

-- ========================================
-- 2. 다른 잘못된 매칭들도 확인
-- ========================================

-- recognize가 "바늘" 관련으로 되어 있는지 확인
SELECT id, english, korean 
FROM words 
WHERE english = 'recognize' 
  AND korean LIKE '%바늘%';

-- needle이 "인정" 관련으로 되어 있는지 확인
SELECT id, english, korean 
FROM words 
WHERE english = 'needle' 
  AND (korean LIKE '%인정%' OR korean LIKE '%알아%');

-- ========================================
-- 3. 수정 쿼리들
-- ========================================

-- provide 올바르게 수정
UPDATE words 
SET korean = 'v . 제공 하다 . 주다'
WHERE english = 'provide' 
  AND korean LIKE '%분배%';

-- distribute 올바르게 수정
UPDATE words 
SET korean = 'v . 분배하다, 배포하다'
WHERE english = 'distribute' 
  AND (korean LIKE '%제공%' OR korean LIKE '%주다%');

-- recognize 올바르게 수정
UPDATE words 
SET korean = 'v . ( 공로 를 ) 인정 하다 : 알아 보다'
WHERE english = 'recognize' 
  AND korean LIKE '%바늘%';

-- needle 올바르게 수정
UPDATE words 
SET korean = 'n . 바늘'
WHERE english = 'needle' 
  AND (korean LIKE '%인정%' OR korean LIKE '%알아%');

-- ========================================
-- 4. CSV 데이터와 비교해서 일괄 수정
-- ========================================

-- CSV 원본과 다른 주요 단어들 수정
UPDATE words SET korean = 'v . 제공 하다 . 주다' WHERE english = 'provide' AND category = 'toeic';
UPDATE words SET korean = 'v . 분배하다, 배포하다' WHERE english = 'distribute' AND category = 'toeic';
UPDATE words SET korean = 'v . ( 공로 를 ) 인정 하다 : 알아 보다' WHERE english = 'recognize' AND category = 'toeic';
UPDATE words SET korean = 'n . 바늘' WHERE english = 'needle' AND category = 'toeic';

-- ========================================
-- 5. 수정 후 검증
-- ========================================

-- 수정된 단어들 확인
SELECT english, korean 
FROM words 
WHERE english IN ('provide', 'distribute', 'recognize', 'needle')
  AND category = 'toeic'
ORDER BY english;

-- 아직 문제가 있는 단어들 찾기 (예시 패턴들)
SELECT id, english, korean
FROM words 
WHERE category = 'toeic'
  AND (
    (english = 'provide' AND korean NOT LIKE '%제공%')
    OR (english = 'distribute' AND korean NOT LIKE '%분배%') 
    OR (english = 'recognize' AND korean NOT LIKE '%인정%')
    OR (english = 'needle' AND korean NOT LIKE '%바늘%')
  );
