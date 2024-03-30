class DirectorsController < ApplicationController

  def showall
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(name: params[:director][:name],
                              nacionality: params[:director][:nacionality],
                              birth_date: params[:director][:birth_date],
                              movie_genre_id: params[:director][:movie_genre_id]
                              )
    if @director.save
      flash[:notice] = "Informações foram salvas com sucesso! ✅"
      return redirect_to new_director_path
    end
    render :new
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])
    if @director.update(name: params[:director][:name],
                        nacionality: params[:director][:nacionality],
                        birth_date: params[:director][:birth_date],
                        movie_genre_id: params[:director][:movie_genre_id]
                        )
      flash[:notice] = 'Informações atualizadas com sucesso!'
      return redirect_to director_path(@director.id)
    end
    render :edit
  end

  def destroy
    @director = Director.find(params[:id])
    @director.destroy
    redirect_to root_path
  end
end