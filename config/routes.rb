Rails.application.routes.draw do

  devise_for :users
  root 'store#index', as: 'store'

  get 'users/sign_out', to: redirect('/')

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  # resources :users, only: [:show]
  resources :carts
  resources :line_items, only: [:create]
  resources :orders, only: [:show]

  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

end
