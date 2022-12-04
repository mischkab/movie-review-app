class ReviewsController < ApplicationController
  before_action :find_user
  
  def create
    @review = Review.create!(review_params)
    @review.user_id = current_user.id
    render json: review.as_json(except: [:created_at, :updated_at])
  end

  private

  def find_user
    @current_user = User.find(2)
  end

  def review_params
    params.permit(:rating, :comment, :movie_id)
  end
end
