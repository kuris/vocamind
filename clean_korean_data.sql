-- 잘못된 형태의 한국어 데이터를 정리하는 SQL

-- ========================================
-- 1. 현재 문제 상황 분석
-- ========================================

-- 문제가 있는 단어들 확인 (품사 정보가 korean 필드에 포함된 경우)
SELECT id, english, korean, part_of_speech
FROM words 
WHERE category = 'toeic'
  AND korean LIKE '%v .%'  -- 동사 표시가 포함된 경우
  OR korean LIKE '%ad .%'  -- 형용사 표시가 포함된 경우
  OR korean LIKE '%n .%'   -- 명사 표시가 포함된 경우
ORDER BY id
LIMIT 20;

-- ========================================
-- 2. 데이터 정리 (한국어에서 품사 정보 분리)
-- ========================================

-- 2-1. 동사(v .) 처리
UPDATE words 
SET 
  korean = TRIM(REGEXP_REPLACE(korean, '^v\s*\.\s*', '')),
  part_of_speech = 'v.'
WHERE category = 'toeic' 
  AND korean LIKE 'v .%';

-- 2-2. 형용사(ad .) 처리  
UPDATE words 
SET 
  korean = TRIM(REGEXP_REPLACE(korean, '^ad\s*\.\s*', '')),
  part_of_speech = 'adj.'
WHERE category = 'toeic' 
  AND korean LIKE 'ad .%';

-- 2-3. 명사(n .) 처리
UPDATE words 
SET 
  korean = TRIM(REGEXP_REPLACE(korean, '^n\s*\.\s*', '')),
  part_of_speech = 'n.'
WHERE category = 'toeic' 
  AND korean LIKE 'n .%';

-- 2-4. 괄호 안의 설명 정리 (예: "( 공로 를 )" 제거)
UPDATE words 
SET korean = TRIM(REGEXP_REPLACE(korean, '\s*\([^)]*\)\s*', ' ', 'g'))
WHERE category = 'toeic' 
  AND korean LIKE '%(%';

-- 2-5. 콜론(:) 뒤의 추가 설명 정리
UPDATE words 
SET korean = TRIM(SPLIT_PART(korean, ':', 1))
WHERE category = 'toeic' 
  AND korean LIKE '%:%';

-- 2-6. 여러 공백을 하나로 정리
UPDATE words 
SET korean = REGEXP_REPLACE(korean, '\s+', ' ', 'g')
WHERE category = 'toeic';

-- ========================================
-- 3. 특정 문제 단어들 수동 수정
-- ========================================

-- recognize 수정
UPDATE words 
SET korean = '인정하다, 알아보다'
WHERE id = 15591 AND english = 'recognize';

-- needle 확인 및 수정 (필요시)
SELECT id, english, korean FROM words WHERE english = 'needle' AND category = 'toeic';

-- ========================================
-- 4. 정리 후 검증
-- ========================================

-- 4-1. 정리된 결과 확인
SELECT id, english, korean, part_of_speech
FROM words 
WHERE category = 'toeic' 
  AND id IN (15591, 2)  -- 문제가 있었던 단어들
ORDER BY id;

-- 4-2. 아직 문제가 있는 단어들 확인
SELECT id, english, korean
FROM words 
WHERE category = 'toeic'
  AND (
    korean LIKE '%v .%' 
    OR korean LIKE '%ad .%' 
    OR korean LIKE '%n .%'
    OR korean LIKE '%(%'
    OR korean LIKE '%:%'
  )
ORDER BY id;

-- 4-3. 전체 데이터 샘플 확인
SELECT id, english, korean, part_of_speech
FROM words 
WHERE category = 'toeic'
ORDER BY id
LIMIT 10;
