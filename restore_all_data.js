import fs from 'fs';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;

if (!supabaseUrl || !supabaseKey) {
  throw new Error('SUPABASE_URL and SUPABASE_KEY must be set in environment variables');
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function restoreAllDataFromDump() {
  console.log('덤프 파일에서 모든 데이터 복원 시작...');
  
  try {
    // 덤프 파일 읽기
    const dumpContent = fs.readFileSync('db_backup/dump-postgres-202509100910.sql', 'utf-8');
    const lines = dumpContent.split('\n');
    
    // 1. 영어 시험 단어 복원
    console.log('\n=== 영어 시험 단어 복원 ===');
    await restoreExamWords(lines);
    
    // 2. 한국어 회화 복원
    console.log('\n=== 한국어 회화 복원 ===');
    await restoreKoreanWords(lines);
    
    // 3. 태국어 대화 복원
    console.log('\n=== 태국어 대화 복원 ===');
    await restoreThaiWords(lines);
    
    console.log('\n✅ 모든 데이터 복원 완료!');
    
  } catch (error) {
    console.error('❌ 복원 중 오류 발생:', error);
  }
}

async function restoreExamWords(lines) {
  const categories = ['toeic', 'toefl', 'suneung', 'gongmuwon', 'gtelp'];
  
  // 기존 데이터 삭제
  for (const category of categories) {
    console.log(`${category.toUpperCase()} 기존 데이터 삭제 중...`);
    
    // word_categories에서 관계 삭제
    await supabase.rpc('delete_word_categories_by_category', { category_name: category });
    
    // words에서 데이터 삭제
    const { error: deleteError } = await supabase
      .from('words')
      .delete()
      .eq('category', category);
      
    if (deleteError) {
      console.error(`${category} 삭제 오류:`, deleteError);
      continue;
    }
  }
  
  // 각 카테고리별 데이터 복원
  for (const category of categories) {
    const categoryLines = lines.filter(line => line.includes(`\t${category}\t`));
    console.log(`${category.toUpperCase()} 복원 중... (${categoryLines.length}개)`);
    
    let success = 0, fail = 0;
    
    for (const line of categoryLines) {
      try {
        const match = line.match(new RegExp(`(\\d+)\\t([^\\t]+)\\t([^\\t]+)\\t([^\\t]*)\\t([^\\t]*)\\t([^\\t]*)\\t${category}\\t([^\\t]*)`));
        
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
                category: category
              });
              
            if (error) {
              fail++;
            } else {
              success++;
              if (success % 500 === 0) {
                console.log(`  ${success}개 복원 완료...`);
              }
            }
          }
        }
      } catch (err) {
        fail++;
      }
    }
    
    console.log(`${category.toUpperCase()} 완료: 성공 ${success}, 실패 ${fail}`);
  }
}

async function restoreKoreanWords(lines) {
  console.log('한국어 회화 기존 데이터 삭제 중...');
  
  // 기존 데이터 삭제
  const { error: deleteError } = await supabase
    .from('words')
    .delete()
    .eq('category', 'kr-en-basic');
    
  if (deleteError) {
    console.error('한국어 삭제 오류:', deleteError);
    return;
  }
  
  const koreanLines = lines.filter(line => line.includes('kr-en-basic'));
  console.log(`한국어 회화 복원 중... (${koreanLines.length}개)`);
  
  let success = 0, fail = 0;
  
  for (const line of koreanLines) {
    try {
      const match = line.match(/(\d+)\t([^\t]+)\t([^\t]+)\t([^\t]*)\t([^\t]*)\t([^\t]*)\tkr-en-basic\t([^\t]*)/);
      
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
              category: 'kr-en-basic'
            });
            
          if (error) {
            fail++;
          } else {
            success++;
          }
        }
      }
    } catch (err) {
      fail++;
    }
  }
  
  console.log(`한국어 회화 완료: 성공 ${success}, 실패 ${fail}`);
}

async function restoreThaiWords(lines) {
  console.log('태국어 대화 기존 데이터 삭제 중...');
  
  // 기존 데이터 삭제
  const { error: deleteError } = await supabase
    .from('words')
    .delete()
    .eq('category', 'thai-conversation');
    
  if (deleteError) {
    console.error('태국어 삭제 오류:', deleteError);
    return;
  }
  
  const thaiLines = lines.filter(line => line.includes('thai-conversation'));
  console.log(`태국어 대화 복원 중... (${thaiLines.length}개)`);
  
  let success = 0, fail = 0;
  
  for (const line of thaiLines) {
    try {
      const match = line.match(/(\d+)\t([^\t]+)\t([^\t]+)\t([^\t]*)\t([^\t]*)\t([^\t]*)\tthai-conversation\t([^\t]*)/);
      
      if (match) {
        const [, id, english, korean, pronunciation, partOfSpeech, tip] = match;
        
        // 한국어가 포함된 데이터만 복원 (영어 단어 제외)
        if (korean && /[가-힣]/.test(korean)) {
          const { error } = await supabase
            .from('words')
            .insert({
              id: parseInt(id),
              english: english === '\\N' ? null : english,
              korean: korean,
              pronunciation: pronunciation === '\\N' ? null : pronunciation,
              part_of_speech: partOfSpeech === '\\N' ? null : partOfSpeech,
              tip: tip === '\\N' ? null : tip,
              category: 'thai-conversation'
            });
            
          if (error) {
            fail++;
          } else {
            success++;
          }
        }
      }
    } catch (err) {
      fail++;
    }
  }
  
  console.log(`태국어 대화 완료: 성공 ${success}, 실패 ${fail}`);
}

restoreAllDataFromDump();
