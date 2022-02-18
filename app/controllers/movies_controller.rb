class MoviesController < ApplicationController
  before_action :set_movie, only: %i[destroy show edit update]
  def index
    if params[:query].present?
      @query = params[:query]
      @movies = Movie.where('title ILIKE ?', "%#{@query}%")
    else
      @movies = Movie.all
    end
  end

  def show
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  def edit
  end

  def update
    @movie.update(movie_params)
    redirect_to movie_path(@movie)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :poster_url, :rating, :overview)
  end
end
