import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { Word } from '../types';

export function useWords() {
  const [words, setWords] = useState<Word[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    async function fetchWords() {
      setLoading(true);
      try {
        // 첫 번째 0~999
        const { data: data1, error: error1 } = await supabase
          .from('words')
          .select('*')
          .order('id', { ascending: true })
          .range(0, 999);

        // 두 번째 1000~1990
        const { data: data2, error: error2 } = await supabase
          .from('words')
          .select('*')
          .order('id', { ascending: true })
          .range(1000, 1990);

        if (error1 || error2) {
          setError((error1?.message || '') + (error2?.message || ''));
        } else {
          setWords([...(data1 || []), ...(data2 || [])]);
        }
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Failed to fetch words');
      }
      setLoading(false);
    }
    fetchWords();
  }, []);

  return { words, loading, error };
}
