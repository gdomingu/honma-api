module Api 
  class QuizCompletionsController < ApplicationController
    def create
      quiz_completion = QuizCompletion.find_or_create_by(user_id: current_user.id, quiz_id: params["quiz_id"])
      json_response(quiz_completion)
    end

    private
    def quiz_completions_params
      params.permit(:quiz_id, :authentication_token)
    end
  end
end
