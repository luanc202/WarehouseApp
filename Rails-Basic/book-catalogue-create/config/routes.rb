Rails.application.routes.draw do
  root to: 'home#index'
  resources :books, only: %i[show new create]
end
