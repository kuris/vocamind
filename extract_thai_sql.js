import fs from 'fs';

function extractThaiDataFromDump() {
  console.log('덤프 파일에서 태국어 데이터 추출 중...');
  
  // 덤프 파일 읽기
  const dumpContent = fs.readFileSync('db_backup/dump-postgres-202509100910.sql', 'utf-8');
  
  // thai-conversation 데이터 라인만 추출
  const lines = dumpContent.split('\n');
  const thaiLines = lines.filter(line => line.includes('thai-conversation'));
  
  console.log(`찾은 태국어 데이터 라인: ${thaiLines.length}개`);
  
  // SQL INSERT 문 생성
  let sqlInserts = [];
  sqlInserts.push('-- 태국어 데이터 복원 스크립트');
  sqlInserts.push('-- 기존 데이터 삭제');
  sqlInserts.push("DELETE FROM words WHERE category = 'thai-conversation';");
  sqlInserts.push('');
  sqlInserts.push('-- 태국어 데이터 복원 (한국어 포함된 것만)');
  
  let validCount = 0;
  
  for (const line of thaiLines) {
    try {
      // SQL INSERT 라인 파싱
      const match = line.match(/(\d+)\t([^\t]+)\t([^\t]+)\t([^\t]*)\t([^\t]*)\t([^\t]*)\tthai-conversation\t([^\t]*)/);
      
      if (match) {
        const [, id, english, korean, pronunciation, partOfSpeech, tip] = match;
        
        // 한국어가 포함된 데이터만 포함 (영어 단어 제외)
        if (korean && /[가-힣]/.test(korean)) {
          const cleanEnglish = english === '\\N' ? 'NULL' : `'${english.replace(/'/g, "''")}'`;
          const cleanKorean = korean === '\\N' ? 'NULL' : `'${korean.replace(/'/g, "''")}'`;
          const cleanPronunciation = pronunciation === '\\N' ? 'NULL' : `'${pronunciation.replace(/'/g, "''")}'`;
          const cleanPartOfSpeech = partOfSpeech === '\\N' ? 'NULL' : `'${partOfSpeech.replace(/'/g, "''")}'`;
          const cleanTip = tip === '\\N' ? 'NULL' : `'${tip.replace(/'/g, "''")}'`;
          
          const insertSql = `INSERT INTO words (id, english, korean, pronunciation, part_of_speech, tip, category) VALUES (${id}, ${cleanEnglish}, ${cleanKorean}, ${cleanPronunciation}, ${cleanPartOfSpeech}, ${cleanTip}, 'thai-conversation');`;
          
          sqlInserts.push(insertSql);
          validCount++;
        }
      }
    } catch (err) {
      console.error('라인 파싱 오류:', err);
    }
  }
  
  console.log(`유효한 태국어 데이터: ${validCount}개`);
  
  // SQL 파일 저장
  fs.writeFileSync('thai_restore.sql', sqlInserts.join('\n'));
  console.log('thai_restore.sql 파일 생성 완료');
  console.log('이 파일을 Supabase SQL 에디터에서 실행하세요.');
}

extractThaiDataFromDump();
