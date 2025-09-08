// ResponsiveVoice type declaration for TypeScript
declare global {
  interface Window {
    responsiveVoice?: {
      speak: (text: string, voice?: string) => void;
    };
  }
}
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
      let text = word.english;
      let lang = 'en-US';
      if (category === 'kr-en-basic') {
        text = word.english;
        lang = 'en-US';
      } else if (category === 'thai-conversation') {
        text = word.english;
        lang = 'th-TH';
      } else if (category === 'kr-en-basic' || category === '일반회화') {
        text = word.korean;
        lang = 'ko-KR';
      }
      const utterance = new window.SpeechSynthesisUtterance(text);
      utterance.lang = lang;
      utterance.rate = 0.8;
      // 해당 언어 voice가 있으면 우선 지정
      const voices = window.speechSynthesis.getVoices();
      const matchVoice = voices.find(v => v.lang === lang);
      if (matchVoice) utterance.voice = matchVoice;
      window.speechSynthesis.speak(utterance);
    }
  };

  // 태국어 일상회화: 한국어(메인), 태국어(english), 태국어 발음(pronunciation)
  const isKoreanBasic = category === 'kr-en-basic';
  const isThaiConversation = category === 'thai-conversation';

  return (
    <div className="bg-white rounded-2xl shadow-xl p-8 mb-8 border border-gray-100 hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1">
      <div className="text-center">
        <div className="flex items-center justify-center gap-4 mb-4">
          <h1
            className="font-bold text-gray-800 tracking-wide mx-auto text-2xl sm:text-5xl sm:max-w-none max-w-[220px] break-words sm:whitespace-nowrap whitespace-normal"
            style={{
              fontSize: (isKoreanBasic ? undefined : (word.english.length > 12 ? '2.2rem' : '3rem')),
              wordBreak: 'break-word',
              lineHeight: '1.2',
            }}
          >
            {isThaiConversation ? word.korean : (isKoreanBasic ? word.korean : word.english)}
          </h1>
          <button
            onClick={speakWord}
            className="p-3 rounded-full bg-gradient-to-r from-blue-500 to-purple-600 text-white hover:from-blue-600 hover:to-purple-700 transition-all duration-200 shadow-lg hover:shadow-xl"
            title="발음 듣기"
          >
            <Volume2 size={24} />
          </button>
        </div>
        {isThaiConversation && word.english && (
          <p className="text-xl text-blue-700 mb-2 font-mono">{word.english}</p>
        )}
        {isThaiConversation && word.pronunciation && (
          <p className="text-lg text-gray-500 mb-4 font-mono">{word.pronunciation}</p>
        )}
        {!isThaiConversation && word.pronunciation && (
          <p className="text-lg text-gray-500 mb-4 font-mono">{word.pronunciation}</p>
        )}
        <div className="w-24 h-1 bg-gradient-to-r from-pink-400 to-blue-500 rounded-full mx-auto mb-6"></div>
        <p className="text-2xl text-gray-700 font-medium leading-relaxed">
          {isThaiConversation ? '' : (isKoreanBasic ? word.english : word.korean)}
        </p>
      </div>
    </div>
  );
};