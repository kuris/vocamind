// 브라우저 콘솔에서 실행할 스크립트
// 문제가 있는 단어들을 찾고 일괄 수정하는 함수

async function findAndFixProblematicWords() {
  console.log('=== 문제가 있는 단어들 검색 및 수정 시작 ===');
  
  // Supabase 클라이언트 가져오기
  const { supabase } = await import('/src/lib/supabase.ts');
  
  // 문제 패턴들 정의
  const problemPatterns = [
    {
      name: '한국어 필드에 영어 단어',
      check: (word) => /^[a-zA-Z\s\-\.]+$/.test(word.korean) && word.korean.length > 1,
      fix: (word) => {
        // english와 korean 필드 교체
        return {
          english: word.korean,
          korean: word.english
        };
      }
    },
    {
      name: '영어 필드에 한국어',
      check: (word) => /[가-힣]/.test(word.english),
      fix: (word) => {
        // english와 korean 필드 교체
        return {
          english: word.korean,
          korean: word.english
        };
      }
    }
  ];
  
  try {
    // TOEIC 카테고리 단어들 가져오기
    const { data: words, error } = await supabase
      .from('words')
      .select('*')
      .eq('category', 'toeic')
      .order('id', { ascending: true });
    
    if (error) {
      console.error('데이터 가져오기 오류:', error);
      return;
    }
    
    console.log(`총 ${words.length}개 TOEIC 단어 검사 중...`);
    
    let totalProblematic = [];
    
    // 각 패턴별로 문제 있는 단어 찾기
    problemPatterns.forEach(pattern => {
      console.log(`\n=== ${pattern.name} ===`);
      const problematicWords = words.filter(pattern.check);
      
      console.log(`발견된 문제 단어: ${problematicWords.length}개`);
      
      if (problematicWords.length > 0) {
        console.log('처음 10개:');
        problematicWords.slice(0, 10).forEach(word => {
          console.log(`ID: ${word.id}, English: "${word.english}", Korean: "${word.korean}"`);
        });
        
        totalProblematic = totalProblematic.concat(
          problematicWords.map(word => ({ ...word, pattern }))
        );
      }
    });
    
    console.log(`\n=== 전체 요약 ===`);
    console.log(`총 문제 단어: ${totalProblematic.length}개 / ${words.length}개`);
    
    if (totalProblematic.length > 0) {
      const proceed = confirm(`${totalProblematic.length}개의 문제 단어를 발견했습니다. 일괄 수정하시겠습니까?`);
      
      if (proceed) {
        console.log('일괄 수정 시작...');
        
        let successCount = 0;
        let errorCount = 0;
        
        for (const problematicWord of totalProblematic) {
          try {
            const fix = problematicWord.pattern.fix(problematicWord);
            
            const { error: updateError } = await supabase
              .from('words')
              .update(fix)
              .eq('id', problematicWord.id);
            
            if (updateError) {
              console.error(`ID ${problematicWord.id} 수정 실패:`, updateError);
              errorCount++;
            } else {
              console.log(`ID ${problematicWord.id} 수정 완료: "${problematicWord.english}" -> "${fix.english}"`);
              successCount++;
            }
          } catch (err) {
            console.error(`ID ${problematicWord.id} 수정 중 오류:`, err);
            errorCount++;
          }
        }
        
        console.log(`\n=== 수정 완료 ===`);
        console.log(`성공: ${successCount}개`);
        console.log(`실패: ${errorCount}개`);
        
        if (successCount > 0) {
          alert(`${successCount}개 단어가 성공적으로 수정되었습니다. 페이지를 새로고침합니다.`);
          window.location.reload();
        }
      }
    } else {
      console.log('문제가 있는 단어를 찾지 못했습니다.');
    }
    
  } catch (err) {
    console.error('스크립트 실행 오류:', err);
  }
}

// 실행
findAndFixProblematicWords();
