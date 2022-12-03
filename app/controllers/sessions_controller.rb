class SessionsController < ApplicationController

  # Log in session creation
  def create
    user = User.find_by(username: user_params[:username])
    if user&.authenticate(user_params[:password])
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: { error: "invalid username or password"}, status: :unauthorized
    end
  end

  # Log out - log in session deleted
  def destroy
    session.delete :user_id
    head :no_content
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
