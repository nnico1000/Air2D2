Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :droids do
    resources :rents, only: [:new, :create]
  end
  resources :rents, only: [:show, :destroy]
  resources :users
end
