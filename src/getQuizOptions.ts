import { Word } from './types';

export function getQuizOptions(words: Word[], currentIndex: number): string[] {
  const correct = words[currentIndex]?.korean;
  const options = [correct];
  const used = new Set([correct]);
  while (options.length < 4 && words.length > 4) {
    const idx = Math.floor(Math.random() * words.length);
    const candidate = words[idx]?.korean;
    if (candidate && !used.has(candidate)) {
      options.push(candidate);
      used.add(candidate);
    }
  }
  // 옵션 섞기
  for (let i = options.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [options[i], options[j]] = [options[j], options[i]];
  }
  return options;
}
