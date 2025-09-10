-- 백업 데이터로 깔끔하게 복원하는 SQL

-- ========================================
-- 1. 현재 백업 파일들 확인
-- ========================================

-- 사용 가능한 백업 파일들:
-- - toeic_restore.sql
-- - exam_words_restore.sql 
-- - dump-postgres-202509100910.sql

-- ========================================
-- 2. 백업 데이터에서 올바른 데이터 확인
-- ========================================

-- 2-1. 현재 문제가 있는 단어들 확인
SELECT id, english, korean 
FROM words 
WHERE category = 'toeic'
  AND (
    korean ~ '^[a-zA-Z\s\-\.]+$' AND length(korean) > 1  -- 한국어 필드에 영어
    OR english ~ '[가-힣]'  -- 영어 필드에 한국어
  )
ORDER BY id;

-- 2-2. recognize, needle 같은 특정 단어들 현재 상태 확인
SELECT id, english, korean 
FROM words 
WHERE category = 'toeic' 
  AND (english IN ('recognize', 'needle') OR korean IN ('recognize', 'needle', '바늘'))
ORDER BY id;

-- ========================================
-- 3. TOEIC 카테고리 전체 데이터 백업 및 복원
-- ========================================

-- 3-1. 현재 상태 백업 (롤백용)
CREATE TABLE words_current_backup_20250910 AS 
SELECT * FROM words WHERE category = 'toeic';

-- 3-2. TOEIC 카테고리 데이터 삭제
DELETE FROM words WHERE category = 'toeic';

-- 3-3. toeic_restore.sql 파일의 데이터로 복원
-- (파일 내용을 직접 실행하거나, 아래와 같이 수동으로 올바른 데이터 삽입)

-- 예시: 문제가 있었던 주요 단어들을 올바르게 삽입
INSERT INTO words (id, english, korean, pronunciation, part_of_speech, tip, category) VALUES
(2, 'needle', '바늘', NULL, NULL, NULL, 'toeic'),
(15591, 'recognize', 'v . ( 공로 를 ) 인정 하다 : 알아 보다', NULL, NULL, NULL, 'toeic');

-- ========================================
-- 4. 대안: SQL 파일 직접 실행
-- ========================================

-- Supabase 대시보드에서 SQL Editor로 이동 후:
-- 1. toeic_restore.sql 파일 내용을 복사
-- 2. 먼저 DELETE FROM words WHERE category = 'toeic'; 실행
-- 3. 그 다음 INSERT 문들 실행

-- ========================================
-- 5. 복원 후 검증
-- ========================================

-- 5-1. 총 단어 개수 확인
SELECT COUNT(*) as total_toeic_words FROM words WHERE category = 'toeic';

-- 5-2. 문제 단어들이 해결되었는지 확인
SELECT 
  '복원 후 한국어 필드에 영어' as check_type,
  COUNT(*) as problem_count
FROM words 
WHERE category = 'toeic'
  AND korean ~ '^[a-zA-Z\s\-\.]+$'
  AND length(korean) > 1

UNION ALL

SELECT 
  '복원 후 영어 필드에 한국어' as check_type,
  COUNT(*) as problem_count
FROM words 
WHERE category = 'toeic'
  AND english ~ '[가-힣]';

-- 5-3. 특정 문제 단어들 확인
SELECT id, english, korean 
FROM words 
WHERE category = 'toeic' 
  AND id IN (2, 15591)  -- 문제가 있었던 ID들
ORDER BY id;

-- ========================================
-- 6. 다른 카테고리도 같은 방식으로 복원
-- ========================================

-- TOEFL 복원
/*
DELETE FROM words WHERE category = 'toefl';
-- exam_words_restore.sql에서 TOEFL 부분 실행
*/

-- 수능 복원  
/*
DELETE FROM words WHERE category = 'suneung';
-- exam_words_restore.sql에서 수능 부분 실행
*/

-- 공무원 복원
/*
DELETE FROM words WHERE category = 'gongmuwon';
-- exam_words_restore.sql에서 공무원 부분 실행
*/

-- GTELP 복원
/*
DELETE FROM words WHERE category = 'gtelp';
-- exam_words_restore.sql에서 GTELP 부분 실행
*/

-- ========================================
-- 7. 전체 복원 (모든 카테고리)
-- ========================================

-- 현재 모든 단어 백업
CREATE TABLE words_full_backup_20250910 AS SELECT * FROM words;

-- 모든 단어 삭제
-- DELETE FROM words;

-- exam_words_restore.sql 전체 실행
-- (파일 내용을 Supabase SQL Editor에 복사 붙여넣기)
