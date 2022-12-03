class UsersController < ApplicationController

  # user sign up
  def create
    user = User.create(user_params)
    if user.valid?
      render json: user, status: :created
    else 
      render json: { error: "Invalid request" }, status: :bad_request
    end  
  end
  
  # stay logged in
  def show
    user = User.find_by(id: session[:user_id])
    if user
      render json: user
    else
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end