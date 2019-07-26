Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
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
  resources :order_items, only: %i[update create destroy]
  resource :cart, only: :show do
    get :checkout
  end
  namespace :checkout do
    resource :fill_address, only: %i[show create]
    resource :fill_delivery, only: %i[show create]
    resource :fill_payment, only: %i[show create]
    resource :fill_confirm, only: %i[show create]
    resource :fill_complete, only: %i[show create]
  end

  root 'home#index'
end
