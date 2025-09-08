// Thai words CSV to Supabase uploader (ESM)
// Usage: node upload_thaiwords.js
// pnpm add @supabase/supabase-js csv-parse

import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import { parse } from 'csv-parse/sync';

const supabaseUrl = process.env.VITE_SUPABASE_URL || 'https://ggtydikxkfozlhnihrwr.supabase.co';
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdndHlkaWt4a2ZvemxobmlocndyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTcwMzUxNzEsImV4cCI6MjA3MjYxMTE3MX0._-VDrO_v7bDeuBMSvqSa1uhnFr020qy9d4zWAg8ISu4';
const supabase = createClient(supabaseUrl, supabaseKey);

const csvFile = 'thaiword_db.csv';
const tableName = 'thaiwords';

const csv = fs.readFileSync(csvFile, 'utf8');
const records = parse(csv, { columns: true });

for (const row of records) {
  if (!row.id) continue;
  const { error } = await supabase.from(tableName).insert(row);
  if (error) {
    console.error(`Error inserting id ${row.id}:`, error.message);
  } else {
    console.log(`Inserted id ${row.id}`);
  }
}
console.log('Upload complete!');
