import React from 'react';
import { Brain, Sparkles } from 'lucide-react';

interface HeaderProps {
  category: string;
  setCategory: (cat: string) => void;
}

export const Header: React.FC<HeaderProps> = ({ category, setCategory }) => {
  const categories = [
    { key: 'toeic', label: 'TOEIC' },
    { key: 'toefl', label: 'TOEFL' },
    { key: 'suneung', label: '수능' },
    { key: 'gongmuwon', label: '공무원' },
    { key: 'gtelp', label: 'GTELP' },
    { key: 'kr-en-basic', label: '기초한국어' },
  ];
  return (
    <header className="bg-gradient-to-r from-purple-400 to-pink-300 shadow-lg p-4 flex flex-col items-center">
      <div className="flex items-center gap-2 mb-2">
        <span className="text-3xl font-bold text-white drop-shadow">MagicVoca</span>
        <span className="text-xl">✨</span>
      </div>
      <nav
        className={
          `flex w-full bg-white rounded-full px-2 sm:px-4 py-1 shadow ` +
          `gap-0.5 sm:gap-2 ` +
          `overflow-x-auto scrollbar-hide max-w-full`
        }
        style={{ WebkitOverflowScrolling: 'touch' }}
      >
        {categories.map(cat => (
          <button
            key={cat.key}
            className={`min-w-[70px] sm:min-w-[120px] font-semibold px-2 sm:px-4 py-1 rounded-full transition-colors whitespace-nowrap ${category === cat.key ? 'bg-purple-100 text-purple-700' : 'text-purple-600 hover:bg-purple-100'}`}
            onClick={() => setCategory(cat.key)}
          >
            {cat.label}
          </button>
        ))}
      </nav>
    </header>
  );
};