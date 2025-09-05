
import 'dotenv/config';
import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const supabaseUrl = process.env.VITE_SUPABASE_URL || '';
const supabaseAnonKey = process.env.VITE_SUPABASE_ANON_KEY || '';
const supabase = createClient(supabaseUrl, supabaseAnonKey);

// CSV 파일 경로
const __dirname = path.dirname(fileURLToPath(import.meta.url));
const csvPath = path.join(__dirname, '../worddata.csv');
const csv = fs.readFileSync(csvPath, 'utf-8');

const words = csv.split('\n').map((line, idx) => {
  const [english, korean] = line.split(',');
  if (!english || !korean) return null;
  return {
    english: english.trim(),
    korean: korean.trim()
  };
}).filter(Boolean);

console.log('Total words parsed:', words.length);

async function seedWords() {
  if (words.length === 0) {
    console.error('No words to insert. Check CSV parsing.');
    return;
  }
  // Supabase는 한 번에 1000개까지만 insert 가능하므로, 1000개씩 나눠서 처리
  const chunkSize = 1000;
  for (let i = 0; i < words.length; i += chunkSize) {
    const chunk = words.slice(i, i + chunkSize);
    const { error } = await supabase.from('words').insert(chunk);
    if (error) {
      console.error('Insert error:', error, chunk);
    } else {
      console.log(`Inserted words ${i + 1} ~ ${i + chunk.length}`);
    }
  }
  console.log('Seeding complete!');
}

seedWords();
