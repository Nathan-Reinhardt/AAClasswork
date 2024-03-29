class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )
    if user
      login(user)
      redirect_to cats_url
    else
      render json: ["unable to login"], status: 401
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

end
