module Api 
  class QuizCompletionController < ApplicationController
    def create
      quiz_completion = QuizCompletion.create!(quiz_completions_params)
      json_response(quiz_completion)
    end

    private
    def quiz_completions_params
      params.permit(:user_id, :quiz_id)
    end
  end
end
