Rails.application.routes.draw do
  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :recipes, only: %i[show new create edit update] do 
    patch :publish, on: :member
  end
  resources :recipe_types, only: %i[new create]
  # Defines the root path route ("/")
  # root "articles#index"
end
