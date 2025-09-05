import React from 'react';
import { Brain, Sparkles } from 'lucide-react';

export const Header: React.FC = () => {
  return (
    <header className="text-center mb-12">
      <div className="flex items-center justify-center gap-3 mb-4">
        <div className="p-3 bg-gradient-to-r from-purple-500 to-pink-500 rounded-full text-white shadow-lg">
          <Brain size={32} />
        </div>
        <h1 className="text-4xl font-bold bg-gradient-to-r from-purple-600 to-pink-600 bg-clip-text text-transparent">
          VoCaMind
        </h1>
        <Sparkles className="text-yellow-400" size={28} />
      </div>
      <p className="text-lg text-gray-600 max-w-2xl mx-auto leading-relaxed">
        영어 단어를 더 쉽고 재미있게! 📚✨<br />
        <span className="text-sm text-gray-500">다른 사람들의 창의적인 기억법도 함께 확인해보세요</span>
      </p>
    </header>
  );
};