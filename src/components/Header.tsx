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
      <nav className="flex gap-4 bg-white rounded-full px-4 py-1 shadow">
        {categories.map(cat => (
          <button
            key={cat.key}
            className={`font-semibold px-3 py-1 rounded-full transition-colors ${category === cat.key ? 'bg-purple-100 text-purple-700' : 'text-purple-600 hover:bg-purple-100'}`}
            onClick={() => setCategory(cat.key)}
          >
            {cat.label}
          </button>
        ))}
      </nav>
    </header>
  );
};