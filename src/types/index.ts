export interface Word {
  id: number;
  english: string;
  korean: string;
  pronunciation?: string;
}

export interface Comment {
  id: number;
  wordId: number;
  content: string;
  author: string;
  createdAt: Date;
}