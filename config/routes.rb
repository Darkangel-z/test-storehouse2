Rails.application.routes.draw do
  devise_for :storekeepers

  root "welcome#index"

  post '/', controller: :welcome, action: :search
  get '/show', controller: :welcome, action: :search

  resources :storekeepers, controller: :storekeepers, only: %i[index new create destroy]

  resources :orders
  resources :products
end
