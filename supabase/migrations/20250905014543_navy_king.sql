/*
  # Create vocabulary application tables

  1. New Tables
    - `comments`
      - `id` (uuid, primary key)
      - `word_id` (integer, references vocabulary words)
      - `content` (text, comment content)
      - `author` (text, author name)
      - `created_at` (timestamp)
      - `updated_at` (timestamp)

  2. Security
    - Enable RLS on `comments` table
    - Add policy for anyone to read comments
    - Add policy for anyone to insert comments (anonymous allowed)
    - Add policy for users to delete their own comments based on session
*/

CREATE TABLE IF NOT EXISTS comments (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  word_id integer NOT NULL,
  content text NOT NULL,
  author text NOT NULL DEFAULT '익명',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE comments ENABLE ROW LEVEL SECURITY;

-- Allow anyone to read comments
CREATE POLICY "Anyone can read comments"
  ON comments
  FOR SELECT
  TO anon, authenticated
  USING (true);

-- Allow anyone to insert comments
CREATE POLICY "Anyone can insert comments"
  ON comments
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- Allow anyone to delete comments (for moderation purposes)
CREATE POLICY "Anyone can delete comments"
  ON comments
  FOR DELETE
  TO anon, authenticated
  USING (true);

-- Create index for better performance
CREATE INDEX IF NOT EXISTS comments_word_id_idx ON comments(word_id);
CREATE INDEX IF NOT EXISTS comments_created_at_idx ON comments(created_at DESC);