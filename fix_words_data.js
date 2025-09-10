import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://nzzwomawuqevbvlsqkny.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im56endvbWF3dXFldmJ2bHNxa255Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU0OTcxMzQsImV4cCI6MjA0MTA3MzEzNH0.VpBrCIKGsXJJk49VQKjzrC8JW0RJJCpGOQ9XPdkDPNU'
);

async function fixWordsData() {
  try {
    console.log('=== ID 2번 단어 확인 ===');
    const { data: word2, error: error1 } = await supabase
      .from('words')
      .select('*')
      .eq('id', 2)
      .single();
    
    if (error1) {
      console.error('Error fetching word ID 2:', error1);
      return;
    }
    
    console.log('ID 2 단어:', word2);
    
    console.log('\n=== needle 단어들 확인 ===');
    const { data: needleWords, error: error2 } = await supabase
      .from('words')
      .select('*')
      .eq('english', 'needle');
    
    if (error2) {
      console.error('Error fetching needle words:', error2);
      return;
    }
    
    console.log('needle 단어들:', needleWords);
    
    console.log('\n=== recognize 단어들 확인 ===');
    const { data: recognizeWords, error: error3 } = await supabase
      .from('words')
      .select('*')
      .eq('english', 'recognize');
    
    if (error3) {
      console.error('Error fetching recognize words:', error3);
      return;
    }
    
    console.log('recognize 단어들:', recognizeWords);
    
    // ID 2번 단어가 잘못되었다면 수정
    if (word2 && word2.english === 'recognize' && word2.korean === '바늘') {
      console.log('\n=== ID 2번 단어 수정 시작 ===');
      
      // needle로 수정
      const { data: updateResult, error: updateError } = await supabase
        .from('words')
        .update({
          english: 'needle',
          korean: '바늘'
        })
        .eq('id', 2);
      
      if (updateError) {
        console.error('Update error:', updateError);
      } else {
        console.log('성공적으로 수정됨:', updateResult);
      }
    }
    
  } catch (err) {
    console.error('Exception:', err);
  }
}

fixWordsData();
