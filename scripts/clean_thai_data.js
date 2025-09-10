import fs from 'fs';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;
if (!supabaseUrl || !supabaseKey) {
  throw new Error('SUPABASE_URL and SUPABASE_KEY must be set in environment variables');
}
const supabase = createClient(supabaseUrl, supabaseKey);

async function cleanAndUploadThaiWords() {
  console.log('Cleaning existing thai-conversation data...');
  
  // 기존 태국어 데이터 삭제
  const { error: deleteError } = await supabase
    .from('words')
    .delete()
    .eq('category', 'thai-conversation');
    
  if (deleteError) {
    console.error('Delete error:', deleteError);
    return;
  }
  
  console.log('Uploading clean thai data from thaiword.csv...');
  
  // 올바른 태국어 데이터 업로드
  const raw = fs.readFileSync('thaiword.csv', 'utf-8');
  const lines = raw.split('\n').slice(1); // 헤더 제거
  
  let success = 0, fail = 0;
  
  for (const line of lines) {
    if (line.trim()) {
      const [korean, english] = line.split(',').map(s => s.trim());
      if (korean && english) {
        const { error } = await supabase
          .from('words')
          .insert({ 
            korean, 
            english, 
            category: 'thai-conversation' 
          });
          
        if (error) {
          fail++;
          console.error('Insert error:', error, korean, english);
        } else {
          success++;
        }
      }
    }
  }
  
  console.log(`Upload complete. Success: ${success}, Fail: ${fail}`);
}

cleanAndUploadThaiWords();
