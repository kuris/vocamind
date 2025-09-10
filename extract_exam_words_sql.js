import fs from 'fs';

function extractExamWordsFromDump() {
  console.log('덤프 파일에서 영어 시험 단어 데이터 추출 중...');
  
  // 덤프 파일 읽기
  const dumpContent = fs.readFileSync('db_backup/dump-postgres-202509100910.sql', 'utf-8');
  
  // 각 시험별 데이터 라인 추출
  const lines = dumpContent.split('\n');
  const toeicLines = lines.filter(line => line.includes('\ttoeic\t'));
  const toeflLines = lines.filter(line => line.includes('\ttoefl\t'));
  const suneungLines = lines.filter(line => line.includes('\tsuneung\t'));
  const gongmuwonLines = lines.filter(line => line.includes('\tgongmuwon\t'));
  const gtelpLines = lines.filter(line => line.includes('\tgtelp\t'));
  
  console.log(`찾은 데이터:`);
  console.log(`- TOEIC: ${toeicLines.length}개`);
  console.log(`- TOEFL: ${toeflLines.length}개`);
  console.log(`- 수능: ${suneungLines.length}개`);
  console.log(`- 공무원: ${gongmuwonLines.length}개`);
  console.log(`- GTELP: ${gtelpLines.length}개`);
  
  // SQL INSERT 문 생성
  let sqlInserts = [];
  sqlInserts.push('-- 영어 시험 단어 데이터 복원 스크립트');
  sqlInserts.push('-- 기존 데이터 삭제 (외래 키 제약 조건 고려)');
  
  const categories = ['toeic', 'toefl', 'suneung', 'gongmuwon', 'gtelp'];
  
  // 각 카테고리별로 삭제 구문 추가
  for (const category of categories) {
    sqlInserts.push(`-- ${category.toUpperCase()} 데이터 삭제`);
    sqlInserts.push(`DELETE FROM word_categories WHERE word_id IN (SELECT id FROM words WHERE category = '${category}');`);
    sqlInserts.push(`DELETE FROM words WHERE category = '${category}';`);
    sqlInserts.push('');
  }
  
  sqlInserts.push('-- 영어 시험 단어 데이터 복원');
  
  const allExamLines = [
    ...toeicLines.map(line => ({ line, category: 'toeic' })),
    ...toeflLines.map(line => ({ line, category: 'toefl' })),
    ...suneungLines.map(line => ({ line, category: 'suneung' })),
    ...gongmuwonLines.map(line => ({ line, category: 'gongmuwon' })),
    ...gtelpLines.map(line => ({ line, category: 'gtelp' }))
  ];
  
  let validCount = 0;
  
  for (const { line, category } of allExamLines) {
    try {
      // SQL INSERT 라인 파싱
      const match = line.match(new RegExp(`(\\d+)\\t([^\\t]+)\\t([^\\t]+)\\t([^\\t]*)\\t([^\\t]*)\\t([^\\t]*)\\t${category}\\t([^\\t]*)`));
      
      if (match) {
        const [, id, english, korean, pronunciation, partOfSpeech, tip] = match;
        
        // 유효한 데이터인지 확인 (영어와 한국어 모두 있어야 함)
        if (english && korean && english !== '\\N' && korean !== '\\N') {
          const cleanEnglish = english.replace(/'/g, "''");
          const cleanKorean = korean.replace(/'/g, "''");
          const cleanPronunciation = pronunciation === '\\N' ? 'NULL' : `'${pronunciation.replace(/'/g, "''")}'`;
          const cleanPartOfSpeech = partOfSpeech === '\\N' ? 'NULL' : `'${partOfSpeech.replace(/'/g, "''")}'`;
          const cleanTip = tip === '\\N' ? 'NULL' : `'${tip.replace(/'/g, "''")}'`;
          
          const insertSql = `INSERT INTO words (id, english, korean, pronunciation, part_of_speech, tip, category) VALUES (${id}, '${cleanEnglish}', '${cleanKorean}', ${cleanPronunciation}, ${cleanPartOfSpeech}, ${cleanTip}, '${category}');`;
          
          sqlInserts.push(insertSql);
          validCount++;
        }
      }
    } catch (err) {
      console.error('라인 파싱 오류:', err);
    }
  }
  
  console.log(`유효한 영어 시험 단어 데이터: ${validCount}개`);
  
  // SQL 파일 저장
  fs.writeFileSync('exam_words_restore.sql', sqlInserts.join('\n'));
  console.log('exam_words_restore.sql 파일 생성 완료');
  console.log('이 파일을 Supabase SQL 에디터에서 실행하세요.');
}

extractExamWordsFromDump();
