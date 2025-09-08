import React from 'react';
import { Word } from '../types';
import { Volume2 } from 'lucide-react';

interface WordCardProps {
  word: Word;
    category?: string;
}

export const WordCard: React.FC<WordCardProps> = ({ word, category }) => {
  const speakWord = () => {
    if ('speechSynthesis' in window) {
      const utterance = new SpeechSynthesisUtterance(word.english);
      utterance.lang = 'en-US';
      utterance.rate = 0.8;
      speechSynthesis.speak(utterance);
    }
  };

  // category prop으로 kr-en-basic일 때 순서 변경
  const isKoreanBasic = category === 'kr-en-basic';

  return (
    <div className="bg-white rounded-2xl shadow-xl p-8 mb-8 border border-gray-100 hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1">
      <div className="text-center">
        <div className="flex items-center justify-center gap-4 mb-4">
            <h1 className="text-5xl font-bold text-gray-800 tracking-wide break-words max-w-[220px] mx-auto" style={{ wordBreak: 'break-word', whiteSpace: 'normal', lineHeight: '1.2' }}>
              {isKoreanBasic ? word.korean : word.english}
            </h1>
          <button
            onClick={speakWord}
            className="p-3 rounded-full bg-gradient-to-r from-blue-500 to-purple-600 text-white hover:from-blue-600 hover:to-purple-700 transition-all duration-200 shadow-lg hover:shadow-xl"
            title="발음 듣기"
          >
            <Volume2 size={24} />
          </button>
        </div>
        {word.pronunciation && (
          <p className="text-lg text-gray-500 mb-4 font-mono">
            {word.pronunciation}
          </p>
        )}
        <div className="w-24 h-1 bg-gradient-to-r from-pink-400 to-blue-500 rounded-full mx-auto mb-6"></div>
        <p className="text-2xl text-gray-700 font-medium leading-relaxed">
          {isKoreanBasic ? word.english : word.korean}
        </p>
      </div>
    </div>
  );
};