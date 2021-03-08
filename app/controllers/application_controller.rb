class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for User
  protect_from_forgery with: :null_session, if: :json_request?

  protected

  def json_request?
    request.format.json?
  end
end
