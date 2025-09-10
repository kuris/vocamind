
import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { Comment } from '../types';

export function useComments(wordId: number) {
  const [comments, setComments] = useState<Comment[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  // Fetch comments for specific wordId
  const fetchComments = async (showLoading = false) => {
    if (!wordId) {
      setComments([]);
      setLoading(false);
      return;
    }
    
    let retryCount = 0;
    const maxRetries = 3;
    
    while (retryCount < maxRetries) {
      try {
        if (showLoading) setLoading(true);
        const { data, error } = await supabase
          .from('comments')
          .select('*')
          .eq('word_id', wordId)
          .order('created_at', { ascending: false });

        if (error) throw error;

        const formattedComments: Comment[] = data.map(comment => ({
          id: parseInt(comment.id.replace(/-/g, '').substring(0, 10), 16),
          wordId: comment.word_id,
          content: comment.content,
          author: comment.author,
          createdAt: new Date(comment.created_at)
        }));

        setComments(formattedComments);
        setError(null); // 성공시 에러 초기화
        return; // 성공시 함수 종료
      } catch (err) {
        retryCount++;
        const errorMessage = err instanceof Error ? err.message : 'Failed to fetch comments';
        
        if (retryCount < maxRetries) {
          console.warn(`댓글 로딩 시도 ${retryCount}/${maxRetries} 실패, 재시도 중...`, err);
          // 재시도 전 대기
          await new Promise(resolve => setTimeout(resolve, retryCount * 1000));
        } else {
          setError(errorMessage);
          console.error('Error fetching comments:', err);
        }
      } finally {
        if (showLoading) setLoading(false);
      }
    }
  };

  // Add new comment
  const addComment = async (wordId: number, content: string, author: string) => {
    try {
      const { data, error } = await supabase
        .from('comments')
        .insert({
          word_id: wordId,
          content: content.trim(),
          author: author.trim() || '익명'
        })
        .select()
        .single();

      if (error) throw error;

      const newComment: Comment = {
        id: parseInt(data.id.replace(/-/g, '').substring(0, 10), 16),
        wordId: data.word_id,
        content: data.content,
        author: data.author,
        createdAt: new Date(data.created_at)
      };

      setComments(prev => [newComment, ...prev]);
      return true;
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to add comment');
      console.error('Error adding comment:', err);
      return false;
    }
  };

  // Delete comment
  const deleteComment = async (commentId: number) => {
    try {
      const commentToDelete = comments.find(c => c.id === commentId);
      if (!commentToDelete) return false;

      const { error } = await supabase
        .from('comments')
        .delete()
        .eq('word_id', commentToDelete.wordId)
        .eq('content', commentToDelete.content)
        .eq('author', commentToDelete.author);

      if (error) throw error;

      setComments(prev => prev.filter(comment => comment.id !== commentId));
      return true;
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to delete comment');
      console.error('Error deleting comment:', err);
      return false;
    }
  };

  useEffect(() => {
    if (!wordId) {
      setComments([]);
      setLoading(false);
      return;
    }
    // Only show loading when navigating (wordId changes)
    fetchComments(true);

    // Set up real-time subscription
    const subscription = supabase
      .channel('comments_changes')
      .on('postgres_changes', 
        { event: '*', schema: 'public', table: 'comments' },
        () => {
          fetchComments(false);
        }
      )
      .subscribe();

    return () => {
      subscription.unsubscribe();
    };
  }, [wordId]);

  return {
    comments,
    loading,
    error,
    addComment,
    deleteComment,
    refetch: fetchComments
  };
}