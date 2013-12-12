class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def render_error(error)
    render json: {error: error.formatted_error}, status: error.http_code
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
