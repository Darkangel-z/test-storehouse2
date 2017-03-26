Rails.application.routes.draw do
  root "orders#index"
  
  devise_for :storekeepers

  resources :orders
  resources :products
  resources :order_items
end
