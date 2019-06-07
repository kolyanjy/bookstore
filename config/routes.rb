Rails.application.routes.draw do
  devise_for :users, controllers: {
  }

  root 'home#index'
end
