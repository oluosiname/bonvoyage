class SessionsController < ApplicationController
  include SessionsHelper

  def login
  end

  def create
    user = User.find_by_email(params[:email])
    password = "$2a$10$8iyAfEv9vT0vL6OHi71M8u92P8vW79Axk5Ox4lrXFGs.DHq37MVzG"
    user = User.new(password_digest: password) unless user

    if user.authenticate(params[:password])
      login_successful user
      redirect_to root_path
    else
      flash["error"] = "Invalid email/password"
      redirect_to login_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
