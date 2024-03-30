class HomeController < ApplicationController
  def index
    @movies = Movie.published
  end
end