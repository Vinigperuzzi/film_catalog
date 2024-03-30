Rails.application.routes.draw do
  root to: 'home#index'
  get '/movie_genres/showall', to: 'movie_genres#showall', as: "showall_movie_genres"
  resources :movie_genres, only: [:show, :new, :create, :edit, :update, :destroy]
  get '/directors/showall', to: 'directors#showall', as: "showall_directors"
  resources :directors, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :movies, only: [:show, :new, :create, :edit, :update, :destroy]
end
