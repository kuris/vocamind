
import React, { useState } from 'react';

interface HeaderProps {
  category: string;
  setCategory: (cat: string) => void;
}

const LANGUAGES = [
  { code: 'US', label: 'US', flag: '🇺🇸', available: true },
  { code: 'KR', label: 'KR', flag: '🇰🇷', available: true },
  { code: 'JP', label: 'JP', flag: '🇯🇵', available: false },
  { code: 'TH', label: 'TH', flag: '🇹🇭', available: false },
  { code: 'CN', label: 'CN', flag: '🇨🇳', available: false },
];

export const Header: React.FC<HeaderProps> = ({ category, setCategory }) => {
  const [selectedLang, setSelectedLang] = useState('US');
  // 영어 관련 카테고리만 보여주기 (US 선택 시)
  const allCategories = [
  { key: 'toeic', label: 'TOEIC', available: true, lang: 'US' },
  { key: 'toefl', label: 'TOEFL', available: true, lang: 'US' },
  { key: 'suneung', label: '수능', available: true, lang: 'US' },
  { key: 'gongmuwon', label: '공무원', available: true, lang: 'US' },
  { key: 'gtelp', label: 'GTELP', available: true, lang: 'US' },
  { key: 'kr-en-basic', label: selectedLang === 'KR' ? '일반회화' : '기초한국어', available: true, lang: 'KR' },
  ];
  const categories = allCategories.filter(cat => selectedLang === 'US' ? cat.lang === 'US' : cat.lang === 'KR');
  return (
    <header className="bg-gradient-to-r from-purple-400 to-pink-300 shadow-lg p-4 flex flex-col items-center rounded-b-3xl">
      <div className="flex items-center gap-2 mb-2">
        <span className="text-3xl font-bold text-white drop-shadow">MagicVoca</span>
        <span className="text-xl">✨</span>
      </div>
      <div className="flex flex-col items-center w-full mb-2">
        <span className="text-white font-semibold mb-1">🌐 학습 언어 선택</span>
  <div className="flex gap-1 sm:gap-2 overflow-x-auto scrollbar-hide whitespace-nowrap justify-center">
          {LANGUAGES.map(lang => (
            <button
              key={lang.code}
              className={`min-w-[60px] font-semibold px-2 py-1 rounded-full transition-colors whitespace-nowrap flex items-center gap-1
                ${selectedLang === lang.code ? 'bg-white text-purple-600 font-bold' : ''}
                ${lang.available ? 'bg-white text-purple-600 hover:bg-purple-100' : 'bg-gray-200 text-gray-400 cursor-not-allowed'}
              `}
              disabled={!lang.available}
              onClick={() => lang.available && setSelectedLang(lang.code)}
            >
              <span className="text-xl">{lang.flag}</span>
              <span>{lang.label}</span>
            </button>
          ))}
        </div>
      </div>
      <nav
        className={
          `flex w-full bg-white rounded-full px-2 sm:px-4 py-1 shadow gap-0.5 sm:gap-2 overflow-x-auto scrollbar-hide max-w-full`
        }
        style={{ WebkitOverflowScrolling: 'touch' }}
      >
        {categories.map(cat => (
          <button
            key={cat.key}
            className={`min-w-[70px] sm:min-w-[120px] font-semibold px-2 sm:px-4 py-1 rounded-full transition-colors whitespace-nowrap
              ${category === cat.key ? 'bg-purple-100 text-purple-700' : 'text-purple-600 hover:bg-purple-100'}
              ${!cat.available ? 'bg-gray-200 text-gray-400 cursor-not-allowed' : ''}
            `}
            onClick={() => cat.available && setCategory(cat.key)}
            disabled={!cat.available}
          >
            {cat.label}
          </button>
        ))}
      </nav>
    </header>
  );
};