class UsersController < ApplicationController
  include SessionsHelper
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      login_successful @user
      redirect_to root_path
    else
      flash["errors"] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def users_params
    params.require(:user).permit(:username, :email, :password)
  end
end
