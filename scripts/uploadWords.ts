import 'dotenv/config';
import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import path from 'path';
import Papa from 'papaparse';

// 환경변수에서 Supabase 정보 불러오기
const supabaseUrl = process.env.VITE_SUPABASE_URL || '';
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY || '';
const supabase = createClient(supabaseUrl, supabaseKey);

// 업로드할 CSV 파일 목록과 카테고리 매핑
const files = [
  { file: 'toeicword.csv', category: 'toeic' },
  { file: 'toeflword.csv', category: 'toefl' },
  { file: 'gongmuwonword.csv', category: 'gongmuwon' },
  { file: 'suneungword.csv', category: 'suneung' },
  { file: 'gtelpword.csv', category: 'gtelp' },
];

async function uploadCSV(filePath: string, category: string) {
  const csv = fs.readFileSync(filePath, 'utf8');
  const { data } = Papa.parse(csv, { header: true, skipEmptyLines: true });
  // 각 row에 category 추가
  const rows = data.map((row: any) => ({ ...row, category }));

  for (const row of rows) {
    // 필드명: english, korean, pronunciation, part_of_speech, tip, category
    const { english, korean, pronunciation, part_of_speech, tip } = row;
    const { error } = await supabase.from('words').insert([
      { english, korean, pronunciation, part_of_speech, tip, category }
    ]);
    if (error) {
      console.error(`Error uploading word: ${english} (${category})`, error.message);
    } else {
      console.log(`Uploaded: ${english} (${category})`);
    }
  }
}

async function main() {
  const baseDir = path.resolve(process.cwd());
  for (const { file, category } of files) {
    const filePath = path.join(baseDir, file);
    if (fs.existsSync(filePath)) {
      console.log(`Uploading ${file} (${category})...`);
      await uploadCSV(filePath, category);
    } else {
      console.warn(`File not found: ${filePath}`);
    }
  }
  console.log('Upload complete!');
}

main();
