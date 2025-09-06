import 'dotenv/config';
import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import 'dotenv/config';
import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import path from 'path';
import Papa from 'papaparse';

// 파일명과 카테고리를 인자로 받음
const args = process.argv.slice(2);
let files;
if (args.length === 2) {
  files = [ { file: args[0], category: args[1] } ];
} else {
  files = [
    { file: 'toeicword.csv', category: 'toeic' },
    { file: 'toeflword.csv', category: 'toefl' },
    { file: 'gongmuwonword.csv', category: 'gongmuwon' },
    { file: 'suneungword.csv', category: 'suneung' },
    { file: 'gtelpword.csv', category: 'gtelp' },
    { file: 'koreanword.csv', category: 'kr-en-basic' },
  ];
  { file: 'koreanword.csv', category: 'kr-en-basic' },
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
