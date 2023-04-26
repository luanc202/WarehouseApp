Rails.application.routes.draw do
  root to: 'home#index'
  get 'book/:id', to: 'book#show', as: 'book'
end
