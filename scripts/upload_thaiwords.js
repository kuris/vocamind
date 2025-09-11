import fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config();

const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_KEY);

async function uploadThaiWords() {
  const raw = fs.readFileSync('thaiword_db.csv', 'utf-8');
  const rows = raw.match(/<tr>[\s\S]*?<\/tr>/g);
  if (!rows) {
    console.log('No <tr> rows found.');
    return;
  }
  for (const row of rows) {
    const cols = Array.from(row.matchAll(/<td.*?>([\s\S]*?)<\/td>/g)).map(m => m[1].replace(/<br\s*\/?>(\s*)?/g, ' ').replace(/&nbsp;/g, ' ').trim());
    if (cols.length === 3) {
      const [korean, thai, pronunciation] = cols;
      // Map thai to 'english' column
  const { error } = await supabase.from('words').insert({ korean, english: thai, pronunciation, category: 'thai-conversation' });
      if (error) {
        console.error('Insert error:', error, korean, thai, pronunciation);
      }
    }
  }
  console.log('Upload complete.');
}

uploadThaiWords();
