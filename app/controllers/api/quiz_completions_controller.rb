module Api 
  class QuizCompletionsController < ApplicationController
    def create
      token = params["authentication_token"]
      user = User.where(authentication_token: token).first
      quiz_completion = QuizCompletion.create!(user_id: user.id, quiz_id: params["quiz_id"])
      json_response(quiz_completion)
    end

    private
    def quiz_completions_params
      params.permit(:quiz_id, :authentication_token)
    end
  end
end
