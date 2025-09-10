import fs from 'fs';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;

if (!supabaseUrl || !supabaseKey) {
  throw new Error('SUPABASE_URL and SUPABASE_KEY must be set in environment variables');
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function restoreThaiFromDump() {
  console.log('덤프 파일에서 태국어 데이터 추출 중...');
  
  // 기존 태국어 데이터 삭제
  console.log('기존 태국어 데이터 삭제 중...');
  const { error: deleteError } = await supabase
    .from('words')
    .delete()
    .eq('category', 'thai-conversation');
    
  if (deleteError) {
    console.error('삭제 오류:', deleteError);
    return;
  }
  
  console.log('기존 데이터 삭제 완료');
  
  // 덤프 파일 읽기
  const dumpContent = fs.readFileSync('db_backup/dump-postgres-202509100910.sql', 'utf-8');
  
  // thai-conversation 데이터 라인만 추출
  const lines = dumpContent.split('\n');
  const thaiLines = lines.filter(line => line.includes('thai-conversation'));
  
  console.log(`찾은 태국어 데이터 라인: ${thaiLines.length}개`);
  
  let success = 0, fail = 0;
  
  for (const line of thaiLines) {
    try {
      // SQL INSERT 라인 파싱
      const match = line.match(/(\d+)\t([^\t]+)\t([^\t]+)\t([^\t]*)\t([^\t]*)\t([^\t]*)\tthai-conversation\t([^\t]*)/);
      
      if (match) {
        const [, id, english, korean, pronunciation, partOfSpeech, tip, category] = match;
        
        // 한국어가 포함된 데이터만 복원 (영어 단어 제외)
        if (korean && /[가-힣]/.test(korean)) {
          const { error } = await supabase
            .from('words')
            .insert({
              id: parseInt(id),
              english: english === '\\N' ? null : english,
              korean: korean === '\\N' ? null : korean,
              pronunciation: pronunciation === '\\N' ? null : pronunciation,
              part_of_speech: partOfSpeech === '\\N' ? null : partOfSpeech,
              tip: tip === '\\N' ? null : tip,
              category: 'thai-conversation'
            });
            
          if (error) {
            fail++;
            console.error('복원 오류:', error.message);
          } else {
            success++;
            if (success % 100 === 0) {
              console.log(`${success}개 복원 완료...`);
            }
          }
        }
      }
    } catch (err) {
      console.error('라인 파싱 오류:', err);
    }
  }
  
  console.log(`태국어 데이터 복원 완료. 성공: ${success}, 실패: ${fail}`);
}

restoreThaiFromDump();
