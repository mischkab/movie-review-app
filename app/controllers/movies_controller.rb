class MoviesController < ApplicationController

  def index
    movies = Movie.all
    render json: movies, status: :ok
  end

  def show
    movie = Movie.find_by(id: params[:id])
    if movie
      render json: movie, status: :ok
    else
      render json: { error: "Movie not found." }, status: :not_found
    end
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
