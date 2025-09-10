-- 문제가 있는 단어들을 찾고 수정하는 SQL 쿼리들

-- ========================================
-- 1. 문제 있는 단어들 찾기
-- ========================================

-- 1-1. 한국어 필드에 영어 단어가 들어간 경우
SELECT id, english, korean, category
FROM words 
WHERE category = 'toeic'
  AND korean ~ '^[a-zA-Z\s\-\.]+$'  -- 한국어 필드가 영어 패턴
  AND length(korean) > 1
ORDER BY id
LIMIT 20;

-- 1-2. 영어 필드에 한국어가 들어간 경우
SELECT id, english, korean, category
FROM words 
WHERE category = 'toeic'
  AND english ~ '[가-힣]'  -- 영어 필드에 한글 포함
ORDER BY id
LIMIT 20;

-- 1-3. 전체 문제 단어 개수 확인
SELECT 
  '한국어 필드에 영어' as problem_type,
  COUNT(*) as count
FROM words 
WHERE category = 'toeic'
  AND korean ~ '^[a-zA-Z\s\-\.]+$'
  AND length(korean) > 1

UNION ALL

SELECT 
  '영어 필드에 한국어' as problem_type,
  COUNT(*) as count
FROM words 
WHERE category = 'toeic'
  AND english ~ '[가-힣]';

-- ========================================
-- 2. 문제 있는 단어들 일괄 수정
-- ========================================

-- 2-1. 한국어 필드에 영어 단어가 들어간 경우 수정 (english <-> korean 교체)
-- 주의: 실행 전에 반드시 백업하고 확인하세요!

-- 임시 테이블에 수정할 데이터 저장
CREATE TEMP TABLE words_to_fix AS
SELECT id, english, korean
FROM words 
WHERE category = 'toeic'
  AND korean ~ '^[a-zA-Z\s\-\.]+$'
  AND length(korean) > 1;

-- 수정할 단어들 미리보기
SELECT 
  id,
  english as current_english,
  korean as current_korean,
  korean as new_english,
  english as new_korean
FROM words_to_fix
ORDER BY id;

-- 실제 수정 실행 (주의: 되돌릴 수 없음!)
/*
UPDATE words 
SET 
  english = words_to_fix.korean,
  korean = words_to_fix.english
FROM words_to_fix
WHERE words.id = words_to_fix.id;
*/

-- 2-2. 영어 필드에 한국어가 들어간 경우 수정
CREATE TEMP TABLE words_to_fix_2 AS
SELECT id, english, korean
FROM words 
WHERE category = 'toeic'
  AND english ~ '[가-힣]';

-- 수정할 단어들 미리보기
SELECT 
  id,
  english as current_english,
  korean as current_korean,
  korean as new_english,
  english as new_korean
FROM words_to_fix_2
ORDER BY id;

-- 실제 수정 실행 (주의: 되돌릴 수 없음!)
/*
UPDATE words 
SET 
  english = words_to_fix_2.korean,
  korean = words_to_fix_2.english
FROM words_to_fix_2
WHERE words.id = words_to_fix_2.id;
*/

-- ========================================
-- 3. 한 번에 모든 문제 수정 (가장 안전한 방법)
-- ========================================

-- 3-1. 백업 테이블 생성
CREATE TABLE words_backup_20250910 AS 
SELECT * FROM words WHERE category = 'toeic';

-- 3-2. 모든 문제 있는 단어들을 한 번에 수정
-- 단계별로 실행해서 확인하면서 진행하세요

-- 먼저 수정될 내용 미리보기
WITH problematic_words AS (
  SELECT 
    id, english, korean,
    CASE 
      WHEN korean ~ '^[a-zA-Z\s\-\.]+$' AND length(korean) > 1 THEN 'swap_needed'
      WHEN english ~ '[가-힣]' THEN 'swap_needed'
      ELSE 'ok'
    END as status
  FROM words 
  WHERE category = 'toeic'
)
SELECT 
  id,
  status,
  english as current_english,
  korean as current_korean,
  CASE 
    WHEN status = 'swap_needed' THEN korean 
    ELSE english 
  END as new_english,
  CASE 
    WHEN status = 'swap_needed' THEN english 
    ELSE korean 
  END as new_korean
FROM problematic_words
WHERE status = 'swap_needed'
ORDER BY id;

-- 실제 일괄 수정 (매우 주의!)
/*
WITH problematic_words AS (
  SELECT 
    id, english, korean,
    CASE 
      WHEN korean ~ '^[a-zA-Z\s\-\.]+$' AND length(korean) > 1 THEN 'swap_needed'
      WHEN english ~ '[가-힣]' THEN 'swap_needed'
      ELSE 'ok'
    END as status
  FROM words 
  WHERE category = 'toeic'
)
UPDATE words 
SET 
  english = CASE 
    WHEN problematic_words.status = 'swap_needed' THEN problematic_words.korean 
    ELSE words.english 
  END,
  korean = CASE 
    WHEN problematic_words.status = 'swap_needed' THEN problematic_words.english 
    ELSE words.korean 
  END
FROM problematic_words
WHERE words.id = problematic_words.id 
  AND problematic_words.status = 'swap_needed';
*/

-- ========================================
-- 4. 수정 후 검증
-- ========================================

-- 수정 후 다시 문제 있는 단어 확인
SELECT 
  '수정 후 한국어 필드에 영어' as check_type,
  COUNT(*) as remaining_count
FROM words 
WHERE category = 'toeic'
  AND korean ~ '^[a-zA-Z\s\-\.]+$'
  AND length(korean) > 1

UNION ALL

SELECT 
  '수정 후 영어 필드에 한국어' as check_type,
  COUNT(*) as remaining_count
FROM words 
WHERE category = 'toeic'
  AND english ~ '[가-힣]';

-- 특정 단어 확인 (예: recognize, needle 등)
SELECT id, english, korean 
FROM words 
WHERE category = 'toeic' 
  AND (english ILIKE '%recognize%' OR korean ILIKE '%recognize%' 
       OR english ILIKE '%needle%' OR korean ILIKE '%needle%')
ORDER BY id;
