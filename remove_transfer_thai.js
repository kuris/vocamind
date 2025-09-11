import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config();

const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_KEY);

async function findAndRemoveTransfer() {
  console.log('태국어 카테고리에서 "transfer" 단어 찾기...');
  
  // 태국어 카테고리에서 transfer 단어 찾기
  const { data: transferWords, error: searchError } = await supabase
    .from('words')
    .select('*')
    .eq('category', 'thai-conversation')
    .or('korean.ilike.%transfer%,english.ilike.%transfer%');

  if (searchError) {
    console.error('검색 오류:', searchError);
    return;
  }

  console.log('찾은 transfer 단어들:', transferWords);

  if (transferWords && transferWords.length > 0) {
    console.log(`${transferWords.length}개의 transfer 관련 단어를 찾았습니다.`);
    
    // 각 단어 삭제
    for (const word of transferWords) {
      console.log(`삭제 중: ID ${word.id}, Korean: "${word.korean}", English: "${word.english}"`);
      
      const { error: deleteError } = await supabase
        .from('words')
        .delete()
        .eq('id', word.id);
        
      if (deleteError) {
        console.error(`삭제 오류 (ID: ${word.id}):`, deleteError);
      } else {
        console.log(`성공적으로 삭제됨: ID ${word.id}`);
      }
    }
  } else {
    console.log('태국어 카테고리에서 transfer 단어를 찾지 못했습니다.');
  }

  // 삭제 후 확인
  const { data: remainingWords, error: checkError } = await supabase
    .from('words')
    .select('*')
    .eq('category', 'thai-conversation')
    .or('korean.ilike.%transfer%,english.ilike.%transfer%');

  if (checkError) {
    console.error('확인 오류:', checkError);
  } else {
    console.log('삭제 후 남은 transfer 단어:', remainingWords);
  }
}

findAndRemoveTransfer();
