export interface Word {
  id: number;
  english: string;
  korean: string;
  pronunciation?: string;
  partOfSpeech?: string;
  tip?: string;
  categories?: string[]; // 카테고리 해시태그용
}

export interface Comment {
  id: number;
  wordId: number;
  content: string;
  author: string;
  createdAt: Date;
}