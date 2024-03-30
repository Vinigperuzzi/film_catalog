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
    @movie = Movie.new(title: params[:movie][:title],
                        release_date: params[:movie][:release_date],
                        sinopsis: params[:movie][:sinopsis],
                        country: params[:movie][:country],
                        duration: params[:movie][:duration],
                        movie_genre_id: params[:movie][:movie_genre_id],
                        director_id: params[:movie][:director_id]
                      )
    
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
    if @movie.update(title: params[:movie][:title],
                      release_date: params[:movie][:release_date],
                      sinopsis: params[:movie][:sinopsis],
                      country: params[:movie][:country],
                      duration: params[:movie][:duration],
                      movie_genre_id: params[:movie][:movie_genre_id],
                      director_id: params[:movie][:director_id]
                    )
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
end