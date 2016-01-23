class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    @user.save
    redirect_to :back
  end

  def users_params
    params.require(:user).permit(:username, :email, :password)
  end
end
