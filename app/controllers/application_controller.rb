class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for User
  protect_from_forgery with: :null_session, if: :json_request?
  skip_before_action :verify_authenticity_token 
  respond_to :html, :json

  protected
    def json_request?
      request.format.json?
    end

  private
    def json_response(object, status = :ok)
      render json: object, status: status
    end

end
