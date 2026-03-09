class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user.password = params["password"]
    if @user.save
      redirect_to "/login"
    else
      flash["notice"] = "Email already taken. Please try a different email."
      redirect_to "/users/new"
    end
  end
end