class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to #something
    else
      flash[:errors] = @user.errors.full_messages
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
