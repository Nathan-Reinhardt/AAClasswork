class ApplicationController < ActionController::Base
  helper_method :login!, :require_login, :logged_in?, :logout, :current_user

  def login!(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def logout
    self.current_user.reset_session_token!
    session[:session_token] = nil
  end

end
