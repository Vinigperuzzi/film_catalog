class MoviesController < ApplicationController
  
  def show
    @movie = Movie.find(params[:id])
  end

  def show_drafts
    @movies = Movie.draft
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(get_params)
    if params[:movie][:movie_status] == "1"
      @movie.released!
    else
      @movie.soon!
    end

    if params[:movie][:status] == "1"
      @movie.published!
    else
      @movie.draft!
    end

    if @movie.save
      flash[:notice] = "Informações foram salvas com sucesso! ✅"
      return redirect_to new_movie_path
    end
    render :new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(get_params)
      if params[:movie][:movie_status] == "1"
        @movie.released!
      else
        @movie.soon!
      end

      if params[:movie][:status] == "1"
        @movie.published!
      else
        @movie.draft!
      end

      flash[:notice] = 'Informações atualizadas com sucesso!'
      return redirect_to movie_path(@movie.id)
    end
    render :edit
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to root_path
  end

  def publish
    movie = Movie.find(params[:id])
    if movie.published?
      movie.draft!
    else
      movie.published!
    end
    return redirect_to movie_path(movie.id)
  end

  private

  def get_params
    params.require(:movie).permit(:title, :release_date, :sinopsis, :country, :duration, :movie_genre_id, :director_id, :cover)
  end
end