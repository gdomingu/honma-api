module Api 
  class QuizCompletionsController < ApplicationController
    def create
      token = params["authentication_token"]
      user = User.find_by(authentication_token: token)
      quiz_completion = QuizCompletion.find_or_create_by(user_id: user.id, quiz_id: params["quiz_id"])
      json_response(quiz_completion)
    end

    private
    def quiz_completions_params
      params.permit(:quiz_id, :authentication_token)
    end
  end
end
