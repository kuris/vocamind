import React, { useState } from 'react';
import { WordCard } from './components/WordCard';
import { CommentSection } from './components/CommentSection';
import { WordNavigation } from './components/WordNavigation';
import { Header } from './components/Header';
import { vocabularyWords } from './data/words';
import { useComments } from './hooks/useComments';

function App() {
  const [currentWordIndex, setCurrentWordIndex] = useState(0);
  const { comments, loading, error, addComment, deleteComment } = useComments();

  const currentWord = vocabularyWords[currentWordIndex];

  const handlePrevious = () => {
    setCurrentWordIndex((prev) => Math.max(0, prev - 1));
  };

  const handleNext = () => {
    setCurrentWordIndex((prev) => Math.min(vocabularyWords.length - 1, prev + 1));
  };

  const handleRandom = () => {
    const randomIndex = Math.floor(Math.random() * vocabularyWords.length);
    setCurrentWordIndex(randomIndex);
  };

  const handleAddComment = async (wordId: number, content: string, author: string) => {
    return await addComment(wordId, content, author);
  };

  const handleDeleteComment = async (commentId: number) => {
    return await deleteComment(commentId);
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 via-white to-purple-50">
      <div className="container mx-auto px-4 py-8 max-w-4xl">
        <Header />
        
        {error && (
          <div className="mb-6 p-4 bg-red-50 border border-red-200 rounded-lg text-red-700">
            <p className="font-medium">오류가 발생했습니다:</p>
            <p className="text-sm">{error}</p>
          </div>
        )}
        
        <WordNavigation
          currentIndex={currentWordIndex}
          totalWords={vocabularyWords.length}
          onPrevious={handlePrevious}
          onNext={handleNext}
          onRandom={handleRandom}
        />
        
        <WordCard word={currentWord} />
        
        <CommentSection
          wordId={currentWord.id}
          word={currentWord}
          comments={comments}
          loading={loading}
          onAddComment={handleAddComment}
          onDeleteComment={handleDeleteComment}
        />
        
        <div className="text-center mt-12 pt-8 border-t border-gray-200">
          <p className="text-gray-500 text-sm">
            💪 꾸준한 학습이 성공의 열쇠입니다 | Made with ❤️ for English learners
          </p>
        </div>
      </div>
    </div>
  );
}

export default App;