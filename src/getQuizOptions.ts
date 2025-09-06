import { Word } from './types';

export function getQuizOptions(words: Word[], currentIndex: number, category?: string): string[] {
  if (category === 'kr-en-basic') {
    // 기초한국어: 정답은 english, 보기 옵션도 english
    const correct = words[currentIndex]?.english;
    const options = [correct];
    const used = new Set([correct]);
    while (options.length < 4 && words.length > 4) {
      const idx = Math.floor(Math.random() * words.length);
      const candidate = words[idx]?.english;
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
  } else {
    // 일반: 정답은 korean, 보기 옵션도 korean
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
}
