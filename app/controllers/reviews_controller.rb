class ReviewsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  before_action :find_movie

  def create
    review = Review.create!(review_params)
    review.movie_id = movie.id
    review.user_id = current_user.id
    render json: review, status: :created
  end

  private

  def render_unprocessable_entity(invalid)
    render json: {error: invalid.record.errors}, status: :unprocessable_entity
  end

  def review_params
    params.permit(:rating, :comment)
  end

  def find_movie
    movie = Movie.find(params[:movie_id])
  end
end
