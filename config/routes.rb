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
  root 'home#index'
end
