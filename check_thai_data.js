import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

// 태국어 데이터 확인
const { data, error } = await supabase
  .from('words')
  .select('*')
  .eq('category', 'thai-conversation')
  .limit(10);

if (error) {
  console.error('Error:', error);
} else {
  console.log('First 10 thai-conversation words:');
  data.forEach((word, index) => {
    console.log(`${index + 1}. Korean: "${word.korean}", English: "${word.english}"`);
  });
}

// "transfer" 같은 단어가 태국어 카테고리에 있는지 확인
const { data: transferData, error: transferError } = await supabase
  .from('words')
  .select('*')
  .eq('category', 'thai-conversation')
  .or('korean.ilike.%transfer%,english.ilike.%transfer%');

if (transferError) {
  console.error('Transfer search error:', transferError);
} else {
  console.log('\nWords containing "transfer" in thai-conversation:');
  console.log(transferData);
}
