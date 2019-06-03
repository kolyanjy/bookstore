Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'registrations',
    confirmations: 'confirmations'
  }

  root 'home#index'
end
