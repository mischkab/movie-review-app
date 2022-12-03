class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.valid?
      render json: user, status: :created
    else 
      render json: { error: "Invalid request" }, status: :bad_request
    end  
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
