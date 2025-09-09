import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { Word } from '../types';

export function useWords(category: string) {
  const [words, setWords] = useState<Word[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    let cancelled = false;
    const start = performance.now();
    async function fetchInitialWords() {
      setLoading(true);
      console.log('[useWords] Initial loading started at', new Date().toISOString());
      try {
        // 1. 첫 50개만 불러오기
        const { data: firstData, error: firstError } = await supabase
          .from('words')
          .select('*')
          .eq('category', category)
          .order('id', { ascending: true })
          .range(0, 49);
        if (firstError) {
          setError(firstError.message);
          setLoading(false);
          return;
        }
        setWords(firstData || []);
        setLoading(false);
        // 2. 백그라운드로 나머지 불러오기
        let allWords = firstData || [];
        let offset = 50;
        const pageSize = 1000;
        let hasMore = true;
        while (hasMore) {
          const { data, error } = await supabase
            .from('words')
            .select('*')
            .eq('category', category)
            .order('id', { ascending: true })
            .range(offset, offset + pageSize - 1);
          if (error) {
            setError(error.message);
            break;
          }
          if (data && data.length > 0) {
            allWords = allWords.concat(data);
            setWords([...allWords]); // 점진적으로 추가
            hasMore = data.length === pageSize;
            offset += pageSize;
          } else {
            hasMore = false;
          }
          if (cancelled) break;
        }
        console.log('Loaded all words:', allWords);
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Failed to fetch words');
      }
      const end = performance.now();
      console.log(`[useWords] All loading finished at ${new Date().toISOString()} (elapsed: ${(end-start).toFixed(2)}ms)`);
    }
    fetchInitialWords();
    return () => { cancelled = true; };
  }, [category]);

  return { words, loading, error };
}
