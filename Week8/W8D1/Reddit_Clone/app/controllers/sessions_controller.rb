class SessionsController < ApplicationController
  
  def new
    user = User.new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if user
      login!(user)
      redirect_to #something
    else
      flash[:errors] = @user.errors.full_messages
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end
