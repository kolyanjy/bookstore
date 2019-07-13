Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  namespace :users do
    resource :address, only: %i[update]
  end
  resources :books, only: %i[index show]
  resources :categories do
    resources :books, only: :index
  end
  resources :orders, only: %i[index show] do
    resources :order_items, only: %i[destroy]
  end
  post 'posts/' => 'order_items#create', as: 'new_order_items'

  root 'home#index'
end
