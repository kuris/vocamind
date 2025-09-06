import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { Word } from '../types';

export function useWords(category: string) {
  const [words, setWords] = useState<Word[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    async function fetchWords() {
      setLoading(true);
      try {
        let allWords: Word[] = [];
        let offset = 0;
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
            hasMore = data.length === pageSize;
            offset += pageSize;
          } else {
            hasMore = false;
          }
        }
        setWords(allWords);
        console.log('Loaded words:', allWords);
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Failed to fetch words');
      }
      setLoading(false);
    }
    fetchWords();
  }, [category]);

  return { words, loading, error };
}
