import fs from 'fs';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;

if (!supabaseUrl || !supabaseKey) {
  throw new Error('SUPABASE_URL and SUPABASE_KEY must be set in environment variables');
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function cleanThaiData() {
  console.log('기존 태국어 데이터 삭제 중...');
  
  // 기존 태국어 데이터 모두 삭제
  const { error: deleteError } = await supabase
    .from('words')
    .delete()
    .eq('category', 'thai-conversation');
    
  if (deleteError) {
    console.error('삭제 오류:', deleteError);
    return;
  }
  
  console.log('기존 데이터 삭제 완료');
  
  // thaiword_db.csv에서 올바른 태국어 데이터 읽기
  console.log('thaiword_db.csv에서 태국어 데이터 로딩 중...');
  
  const raw = fs.readFileSync('thaiword_db.csv', 'utf-8');
  const rows = raw.match(/<tr>[\s\S]*?<\/tr>/g);
  
  if (!rows) {
    console.log('태국어 데이터를 찾을 수 없습니다.');
    return;
  }
  
  let success = 0, fail = 0;
  
  for (const row of rows) {
    const cols = Array.from(row.matchAll(/<td.*?>([\s\S]*?)<\/td>/g))
      .map(m => m[1].replace(/<br\s*\/?>(\s*)?/g, ' ').replace(/&nbsp;/g, ' ').trim());
    
    if (cols.length === 3) {
      const [korean, thai, pronunciation] = cols;
      
      // 영어 단어 필터링 (한글이나 태국어 문자가 포함된 것만 허용)
      const hasKorean = /[가-힣]/.test(korean);
      const hasThai = /[\u0E00-\u0E7F]/.test(thai);
      
      if (hasKorean && hasThai && korean.trim() && thai.trim()) {
        const { error } = await supabase
          .from('words')
          .insert({ 
            korean: korean.trim(), 
            english: thai.trim(), 
            pronunciation: pronunciation.trim(), 
            category: 'thai-conversation' 
          });
          
        if (error) {
          fail++;
          console.error('업로드 오류:', error.message, korean, thai);
        } else {
          success++;
          if (success % 100 === 0) {
            console.log(`${success}개 업로드 완료...`);
          }
        }
      }
    }
  }
  
  console.log(`태국어 데이터 업로드 완료. 성공: ${success}, 실패: ${fail}`);
}

cleanThaiData();
