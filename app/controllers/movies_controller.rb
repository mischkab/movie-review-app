class MoviesController < ApplicationController

  def index
    movies = Movie.all
    render json: movies, status: :ok
  end

  def create
    movie = Movie.create(movie_params)
    render json: movie, status: :created
  end

  private

  def movie_params
    params.permit(:title, :overview, :director)
  end
end
