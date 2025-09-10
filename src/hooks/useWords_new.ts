import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { Word } from '../types';

export function useWords(category?: string) {
  const [words, setWords] = useState<Word[]>([]);
  const [loading, setLoading] = useState(true);
  const [loadingMore, setLoadingMore] = useState(false);
  const [hasMore, setHasMore] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [allWordsData, setAllWordsData] = useState<Word[]>([]);
  const [currentPage, setCurrentPage] = useState(0);

  const WORDS_PER_PAGE = 50;

  useEffect(() => {
    async function fetchAllWords() {
      try {
        setLoading(true);
        setError(null);
        
        console.log('Fetching words with category filter:', category);

        // word_categories와 categories 데이터 가져오기
        const { data: wordCategoriesData, error: wcError } = await supabase
          .from('word_categories')
          .select('word_id, category_id');
        
        const { data: categoriesData, error: catError } = await supabase
          .from('categories')
          .select('id, name');

        console.log('Word categories data:', wordCategoriesData?.length || 0, 'relationships');
        console.log('Categories data:', categoriesData);

        if (wcError || catError) {
          console.error('Error fetching categories:', wcError || catError);
          setError('Failed to fetch categories');
          setLoading(false);
          return;
        }

        // 카테고리 필터링 적용
        let filteredWordCategories = wordCategoriesData || [];
        if (category && categoriesData) {
          const categoryMap = new Map();
          categoriesData.forEach((cat: any) => {
            categoryMap.set(cat.id, cat.name);
          });

          const targetCategoryIds = Array.from(categoryMap.entries())
            .filter(([_, name]) => name.toLowerCase() === category.toLowerCase())
            .map(([id, _]) => id);

          console.log(`Filtering for category '${category}', found IDs:`, targetCategoryIds);

          filteredWordCategories = wordCategoriesData.filter((wc: any) => 
            targetCategoryIds.includes(wc.category_id)
          );
        }

        console.log(`After category filtering: ${filteredWordCategories.length} word-category relationships`);

        // word_categories에 있는 word_id들만 추출
        const wordIdsWithCategories = new Set();
        filteredWordCategories.forEach((wc: any) => {
          wordIdsWithCategories.add(wc.word_id);
        });

        const wordIdsArray = Array.from(wordIdsWithCategories) as number[];
        console.log(`Total word IDs to fetch: ${wordIdsArray.length}`);

        if (wordIdsArray.length === 0) {
          console.log('No word IDs found after filtering');
          setWords([]);
          setAllWordsData([]);
          setHasMore(false);
          setLoading(false);
          return;
        }

        // 첫 50개만 즉시 로딩
        const firstBatch = wordIdsArray.slice(0, WORDS_PER_PAGE);
        const { data: firstBatchData, error: firstBatchError } = await supabase
          .from('words')
          .select('id, english, korean, pronunciation, part_of_speech, tip')
          .in('id', firstBatch)
          .order('id', { ascending: true });

        if (firstBatchError) {
          console.error('Error fetching first batch:', firstBatchError);
          setError(firstBatchError.message);
          setLoading(false);
          return;
        }

        // 카테고리 매핑 생성
        const categoryMap = new Map();
        if (categoriesData) {
          categoriesData.forEach((cat: any) => {
            categoryMap.set(cat.id, cat.name);
          });
        }

        // 단어별 카테고리 매핑 생성
        const wordCategoryMap = new Map();
        if (wordCategoriesData) {
          wordCategoriesData.forEach((wc: any) => {
            if (!wordCategoryMap.has(wc.word_id)) {
              wordCategoryMap.set(wc.word_id, []);
            }
            const categoryName = categoryMap.get(wc.category_id);
            if (categoryName) {
              wordCategoryMap.get(wc.word_id).push(categoryName);
            }
          });
        }

        // 첫 배치 words와 categories를 조합
        const firstWords: Word[] = (firstBatchData || []).map((w: any) => ({
          id: w.id,
          english: w.english,
          korean: w.korean,
          pronunciation: w.pronunciation,
          partOfSpeech: w.part_of_speech,
          tip: w.tip,
          categories: wordCategoryMap.get(w.id) || []
        }));

        console.log(`First batch loaded: ${firstWords.length} words`);
        setWords(firstWords);
        setCurrentPage(1);
        setHasMore(wordIdsArray.length > WORDS_PER_PAGE);
        setLoading(false);

        // 백그라운드에서 나머지 모든 데이터 로딩
        if (wordIdsArray.length > WORDS_PER_PAGE) {
          loadRemainingWordsInBackground(wordIdsArray, wordCategoryMap);
        }

      } catch (err) {
        console.error('Error in fetchAllWords:', err);
        setError(err instanceof Error ? err.message : 'Failed to fetch words');
        setLoading(false);
      }
    }

    async function loadRemainingWordsInBackground(wordIdsArray: number[], wordCategoryMap: Map<number, string[]>) {
      try {
        console.log('Loading remaining words in background...');
        
        const remainingIds = wordIdsArray.slice(WORDS_PER_PAGE);
        const BATCH_SIZE = 1000;
        const batches = [];
        
        for (let i = 0; i < remainingIds.length; i += BATCH_SIZE) {
          batches.push(remainingIds.slice(i, i + BATCH_SIZE));
        }

        let allRemainingData: any[] = [];
        for (let i = 0; i < batches.length; i++) {
          const batch = batches[i];
          
          const { data: batchData, error: batchError } = await supabase
            .from('words')
            .select('id, english, korean, pronunciation, part_of_speech, tip')
            .in('id', batch)
            .order('id', { ascending: true });

          if (batchError) {
            console.error(`Error fetching background batch ${i + 1}:`, batchError);
            continue;
          }

          if (batchData) {
            allRemainingData = allRemainingData.concat(batchData);
          }
        }

        // 모든 단어 데이터 변환
        const allWords: Word[] = allRemainingData.map((w: any) => ({
          id: w.id,
          english: w.english,
          korean: w.korean,
          pronunciation: w.pronunciation,
          partOfSpeech: w.part_of_speech,
          tip: w.tip,
          categories: wordCategoryMap.get(w.id) || []
        }));

        console.log(`Background loading completed: ${allWords.length} additional words loaded`);
        setAllWordsData(allWords);

      } catch (err) {
        console.error('Error loading remaining words:', err);
      }
    }

    fetchAllWords();
    setCurrentPage(0); // 카테고리 변경 시 페이지 리셋
  }, [category]);

  // 더 많은 단어 로드 (레이지 로딩)
  const loadMore = () => {
    if (loadingMore || !hasMore) return;

    setLoadingMore(true);
    
    const startIndex = currentPage * WORDS_PER_PAGE;
    const endIndex = startIndex + WORDS_PER_PAGE;
    const nextWords = allWordsData.slice(startIndex, endIndex);

    if (nextWords.length > 0) {
      setWords(prevWords => [...prevWords, ...nextWords]);
      setCurrentPage(prev => prev + 1);
      
      // 더 이상 로드할 단어가 없는지 확인
      if (endIndex >= allWordsData.length) {
        setHasMore(false);
      }
    } else {
      setHasMore(false);
    }

    setLoadingMore(false);
  };

  return { 
    words, 
    loading, 
    loadingMore,
    hasMore,
    error, 
    loadMore,
    totalWords: words.length + allWordsData.length
  };
}
