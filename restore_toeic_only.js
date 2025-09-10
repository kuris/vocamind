import fs from 'fs';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;

if (!supabaseUrl || !supabaseKey) {
  throw new Error('SUPABASE_URL and SUPABASE_KEY must be set in environment variables');
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function restoreToeicWords() {
  console.log('TOEIC 단어 복원 시작...');
  
  try {
    // 덤프 파일 읽기
    const dumpContent = fs.readFileSync('db_backup/dump-postgres-202509100910.sql', 'utf-8');
    const lines = dumpContent.split('\n');
    
    // TOEIC 라인만 추출
    const toeicLines = lines.filter(line => line.includes('\ttoeic\t'));
    console.log(`찾은 TOEIC 데이터: ${toeicLines.length}개`);
    
    // 기존 TOEIC 데이터 삭제
    console.log('기존 TOEIC 데이터 삭제 중...');
    
    // word_categories에서 TOEIC 관계 삭제
    const { error: categoriesError } = await supabase
      .from('word_categories')
      .delete()
      .in('word_id', 
        (await supabase
          .from('words')
          .select('id')
          .eq('category', 'toeic')
        ).data?.map(w => w.id) || []
      );
    
    if (categoriesError) {
      console.error('word_categories 삭제 오류:', categoriesError);
    }
    
    // words에서 TOEIC 데이터 삭제
    const { error: deleteError } = await supabase
      .from('words')
      .delete()
      .eq('category', 'toeic');
      
    if (deleteError) {
      console.error('TOEIC 데이터 삭제 오류:', deleteError);
      return;
    }
    
    console.log('기존 TOEIC 데이터 삭제 완료');
    
    // TOEIC 데이터 복원
    console.log('TOEIC 데이터 복원 중...');
    let success = 0, fail = 0;
    
    for (const line of toeicLines) {
      try {
        const match = line.match(/(\d+)\t([^\t]+)\t([^\t]+)\t([^\t]*)\t([^\t]*)\t([^\t]*)\ttoeic\t([^\t]*)/);
        
        if (match) {
          const [, id, english, korean, pronunciation, partOfSpeech, tip] = match;
          
          if (english && korean && english !== '\\N' && korean !== '\\N') {
            const { error } = await supabase
              .from('words')
              .insert({
                id: parseInt(id),
                english: english,
                korean: korean,
                pronunciation: pronunciation === '\\N' ? null : pronunciation,
                part_of_speech: partOfSpeech === '\\N' ? null : partOfSpeech,
                tip: tip === '\\N' ? null : tip,
                category: 'toeic'
              });
              
            if (error) {
              fail++;
              if (fail <= 5) {
                console.error('삽입 오류:', error.message);
              }
            } else {
              success++;
              if (success % 100 === 0) {
                console.log(`${success}개 복원 완료...`);
              }
            }
          }
        }
      } catch (err) {
        fail++;
      }
    }
    
    console.log(`\n✅ TOEIC 복원 완료!`);
    console.log(`성공: ${success}개, 실패: ${fail}개`);
    
  } catch (error) {
    console.error('❌ 복원 중 오류 발생:', error);
  }
}

restoreToeicWords();
