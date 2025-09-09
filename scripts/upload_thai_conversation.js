import fs from 'fs';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;
if (!supabaseUrl || !supabaseKey) {
  throw new Error('SUPABASE_URL and SUPABASE_KEY must be set in environment variables');
}
const supabase = createClient(supabaseUrl, supabaseKey);

async function uploadThaiConversation() {
  const raw = fs.readFileSync('thaiword_db.csv', 'utf-8');
  const rows = raw.match(/<tr>[\s\S]*?<\/tr>/g);
  if (!rows) {
    console.log('No <tr> rows found.');
    return;
  }
  let success = 0, fail = 0;
  for (const row of rows) {
    const cols = Array.from(row.matchAll(/<td.*?>([\s\S]*?)<\/td>/g)).map(m => m[1].replace(/<br\s*\/?>(\s*)?/g, ' ').replace(/&nbsp;/g, ' ').trim());
    if (cols.length === 3) {
      const [korean, thai, pronunciation] = cols;
      const { error } = await supabase.from('words').insert({ korean, english: thai, pronunciation, category: 'thai-conversation' });
      if (error) {
        fail++;
        console.error('Insert error:', error, korean, thai, pronunciation);
      } else {
        success++;
      }
    }
  }
  console.log(`Upload complete. Success: ${success}, Fail: ${fail}`);
}

uploadThaiConversation();
