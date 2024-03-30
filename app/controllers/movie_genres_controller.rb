class MovieGenresController < ApplicationController

  def showall
    @movie_genres = MovieGenre.all
  end

  def show
    @movie_genre = MovieGenre.find(params[:id])
  end

  def new
    @movie_genre = MovieGenre.new
  end

  def create
    @movie_genre = MovieGenre.new(genre: params[:movie_genre][:genre])
    if @movie_genre.save
      flash[:notice] = "Informações foram salvas com sucesso! ✅"
      return redirect_to new_movie_genre_path
    end
    render :new
  end

  def edit
    @movie_genre = MovieGenre.find(params[:id])
  end

  def update
    @movie_genre = MovieGenre.find(params[:id])
    if @movie_genre.update(genre: params[:movie_genre][:genre])
      flash[:notice] = 'Informações atualizadas com sucesso!'
      return redirect_to movie_genre_path(@movie_genre.id)
    end
    render :edit
  end

  def destroy
    @movie_genre = MovieGenre.find(params[:id])
    @movie_genre.destroy
    redirect_to root_path
  end
end