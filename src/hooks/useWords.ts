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
      const { data, error } = await supabase
        .from('words')
        .select('*')
        .order('id', { ascending: true })
        .range(0, 1990); // fetch all 1991 words
      if (error) {
        setError(error.message);
      } else {
        setWords(data || []);
      }
      setLoading(false);
    }
    fetchWords();
  }, []);

  return { words, loading, error };
}
