import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://nzzwomawuqevbvlsqkny.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im56endvbWF3dXFldmJ2bHNxa255Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU0OTcxMzQsImV4cCI6MjA0MTA3MzEzNH0.VpBrCIKGsXJJk49VQKjzrC8JW0RJJCpGOQ9XPdkDPNU'
);

// 문제가 있을 수 있는 패턴들을 정의
const problemPatterns = [
  // 한국어가 영어 단어인 경우 (예: korean이 영어 단어)
  {
    name: '한국어 필드에 영어 단어',
    check: (word) => /^[a-zA-Z\s]+$/.test(word.korean) && word.korean.length > 1
  },
  // 영어가 한국어인 경우 (예: english가 한글)
  {
    name: '영어 필드에 한국어',
    check: (word) => /[가-힣]/.test(word.english)
  },
  // 발음이 한국어인 경우
  {
    name: '발음 필드에 한국어',
    check: (word) => word.pronunciation && /[가-힣]/.test(word.pronunciation) && !word.pronunciation.includes('(')
  },
  // 너무 긴 단어 (오류 가능성)
  {
    name: '비정상적으로 긴 단어',
    check: (word) => word.english.length > 50 || word.korean.length > 100
  }
];

async function findProblematicWords() {
  try {
    console.log('=== 문제가 있는 단어들 검색 시작 ===');
    
    // 모든 TOEIC 단어 가져오기 (배치로)
    let allWords = [];
    let from = 0;
    const batchSize = 1000;
    
    while (true) {
      const { data: batch, error } = await supabase
        .from('words')
        .select('*')
        .eq('category', 'toeic')
        .range(from, from + batchSize - 1);
      
      if (error) {
        console.error('배치 가져오기 오류:', error);
        break;
      }
      
      if (!batch || batch.length === 0) {
        break;
      }
      
      allWords = allWords.concat(batch);
      
      if (batch.length < batchSize) {
        break;
      }
      
      from += batchSize;
    }
    
    console.log(`총 ${allWords.length}개 TOEIC 단어 검사 중...`);
    
    // 각 패턴별로 문제 있는 단어 찾기
    problemPatterns.forEach(pattern => {
      console.log(`\n=== ${pattern.name} ===`);
      const problematicWords = allWords.filter(pattern.check);
      
      console.log(`발견된 문제 단어: ${problematicWords.length}개`);
      
      problematicWords.slice(0, 10).forEach(word => {
        console.log(`ID: ${word.id}, English: "${word.english}", Korean: "${word.korean}", Pronunciation: "${word.pronunciation || 'null'}"`);
      });
      
      if (problematicWords.length > 10) {
        console.log(`... 그리고 ${problematicWords.length - 10}개 더`);
      }
    });
    
    // 전체 문제 요약
    const allProblematic = allWords.filter(word => 
      problemPatterns.some(pattern => pattern.check(word))
    );
    
    console.log(`\n=== 전체 요약 ===`);
    console.log(`총 문제 단어: ${allProblematic.length}개 / ${allWords.length}개`);
    console.log(`문제 비율: ${(allProblematic.length / allWords.length * 100).toFixed(2)}%`);
    
  } catch (err) {
    console.error('스크립트 실행 오류:', err);
  }
}

findProblematicWords();
