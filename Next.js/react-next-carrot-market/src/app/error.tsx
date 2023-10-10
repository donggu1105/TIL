'use client';

import EmptyState from "@/components/EmptyState";
import { useEffect } from "react";


interface ErrorStateProps {
  error: Error
}

const ErrorState: React.FC<ErrorStateProps> = ({ error }) => {
  useEffect(() => {
    console.error(error);
  }, [error]);

  return (
    <EmptyState
      title="문제가 발생했습니다."
      subtitle="잠시 문제가 발생했습니다."
    />
  );
}

export default ErrorState;
