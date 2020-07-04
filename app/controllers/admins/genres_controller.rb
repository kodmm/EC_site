class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to admins_genres_path
    else 
      @genre = genre
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
    @genres = Genre.all
  end

  def update
    genre = Genre.find(params[:id])
    genre = genre.update(genre_params)
    redirect_to admins_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :status)
  end

end
