import fs from 'fs';

function extractToeicOnlyFromDump() {
  console.log('덤프 파일에서 TOEIC 데이터만 추출 중...');
  
  // 덤프 파일 읽기
  const dumpContent = fs.readFileSync('db_backup/dump-postgres-202509100910.sql', 'utf-8');
  
  // TOEIC 데이터 라인만 추출
  const lines = dumpContent.split('\n');
  const toeicLines = lines.filter(line => line.includes('\ttoeic\t'));
  
  console.log(`찾은 TOEIC 데이터 라인: ${toeicLines.length}개`);
  
  // SQL INSERT 문 생성
  let sqlInserts = [];
  sqlInserts.push('-- TOEIC 단어 데이터 복원 스크립트');
  sqlInserts.push('-- 기존 데이터 삭제 (외래 키 제약 조건 고려)');
  sqlInserts.push('-- 1. word_categories 테이블에서 TOEIC 단어들의 관계 삭제');
  sqlInserts.push("DELETE FROM word_categories WHERE word_id IN (SELECT id FROM words WHERE category = 'toeic');");
  sqlInserts.push('-- 2. words 테이블에서 TOEIC 데이터 삭제');
  sqlInserts.push("DELETE FROM words WHERE category = 'toeic';");
  sqlInserts.push('');
  sqlInserts.push('-- TOEIC 단어 데이터 복원');
  
  let validCount = 0;
  
  for (const line of toeicLines) {
    try {
      // SQL INSERT 라인 파싱
      const match = line.match(/(\d+)\t([^\t]+)\t([^\t]+)\t([^\t]*)\t([^\t]*)\t([^\t]*)\ttoeic\t([^\t]*)/);
      
      if (match) {
        const [, id, english, korean, pronunciation, partOfSpeech, tip] = match;
        
        // 유효한 데이터인지 확인 (영어와 한국어 모두 있어야 함)
        if (english && korean && english !== '\\N' && korean !== '\\N') {
          const cleanEnglish = english.replace(/'/g, "''");
          const cleanKorean = korean.replace(/'/g, "''");
          const cleanPronunciation = pronunciation === '\\N' ? 'NULL' : `'${pronunciation.replace(/'/g, "''")}'`;
          const cleanPartOfSpeech = partOfSpeech === '\\N' ? 'NULL' : `'${partOfSpeech.replace(/'/g, "''")}'`;
          const cleanTip = tip === '\\N' ? 'NULL' : `'${tip.replace(/'/g, "''")}'`;
          
          const insertSql = `INSERT INTO words (id, english, korean, pronunciation, part_of_speech, tip, category) VALUES (${id}, '${cleanEnglish}', '${cleanKorean}', ${cleanPronunciation}, ${cleanPartOfSpeech}, ${cleanTip}, 'toeic');`;
          
          sqlInserts.push(insertSql);
          validCount++;
        }
      }
    } catch (err) {
      console.error('라인 파싱 오류:', err);
    }
  }
  
  console.log(`유효한 TOEIC 데이터: ${validCount}개`);
  
  // SQL 파일 저장
  fs.writeFileSync('toeic_restore.sql', sqlInserts.join('\n'));
  console.log('toeic_restore.sql 파일 생성 완료');
  console.log('이 파일을 Supabase SQL 에디터에서 실행하세요.');
}

extractToeicOnlyFromDump();
