import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://nzzwomawuqevbvlsqkny.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im56endvbWF3dXFldmJ2bHNxa255Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU0OTcxMzQsImV4cCI6MjA0MTA3MzEzNH0.VpBrCIKGsXJJk49VQKjzrC8JW0RJJCpGOQ9XPdkDPNU'
);

async function checkWord2() {
  try {
    console.log('=== 직접 데이터베이스 확인 ===');
    
    // ID 2번 단어 확인
    const { data: word2, error: error1 } = await supabase
      .from('words')
      .select('*')
      .eq('id', 2)
      .single();
    
    console.log('ID 2 단어:', word2);
    console.log('에러:', error1);
    
    // TOEIC 카테고리 첫 5개 단어 확인
    const { data: toeicWords, error: error2 } = await supabase
      .from('words')
      .select('*')
      .eq('category', 'toeic')
      .order('id', { ascending: true })
      .limit(5);
    
    console.log('\nTOEIC 카테고리 첫 5개 단어:');
    if (toeicWords) {
      toeicWords.forEach((word, index) => {
        console.log(`${index}: ID=${word.id}, English="${word.english}", Korean="${word.korean}"`);
      });
    }
    
    // recognize가 포함된 단어들
    const { data: recognizeWords, error: error3 } = await supabase
      .from('words')
      .select('*')
      .ilike('english', '%recognize%')
      .limit(3);
    
    console.log('\nrecognize 포함 단어들:');
    if (recognizeWords) {
      recognizeWords.forEach(word => {
        console.log(`ID=${word.id}, English="${word.english}", Korean="${word.korean}"`);
      });
    }
    
  } catch (err) {
    console.error('스크립트 실행 오류:', err);
  }
}

checkWord2();
