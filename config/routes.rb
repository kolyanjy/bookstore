Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  resources :books, only: %i[index show] do
    resources :comments, only: :create
  end

  namespace :users do
    resource :address, only: %i[update]
  end

  resources :categories do
    resources :books, only: :index
  end
  resources :orders, only: %i[index show] do
    resources :order_items, only: %i[destroy]
  end
  resources :order_items do
    member do
      patch 'increment_quantity'
      patch 'decrement_quantity'
    end
  end
  resources :checkout, only: %i[update show]

  get 'cart/:id' => 'orders#cart', as: 'cart'
  post 'posts/' => 'order_items#create', as: 'new_order_items'

  root 'home#index'
end
