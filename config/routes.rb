Rails.application.routes.draw do
  resources :books, only: %i[index show] do
    resources :comments, only: :create
  end

  root to: 'home#index'
end
