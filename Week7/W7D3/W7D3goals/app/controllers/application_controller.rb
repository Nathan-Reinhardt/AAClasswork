class ApplicationController < ActionController::Base

  def log_in!(user)
    session[:session_token] = user.session_token
  end

  def current_user
    @current_user ||= User.find_by(session[:session_token])
  end
end
