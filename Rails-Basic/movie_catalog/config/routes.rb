Rails.application.routes.draw do
  resources :movies
  resources :directors
  resources :movie_genres
  root to: 'home#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
