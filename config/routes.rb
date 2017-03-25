Rails.application.routes.draw do
  devise_for :storekeepers
  resources :orders
  resources :products
end
