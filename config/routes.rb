Rails.application.routes.draw do
  devise_for :users
  root to: 'topos#index'
  resources :topos, only: [:index, :show] do
    resources :comments, only: [:create, :update]
    resources :favorites, only: [:create]
  end
  resources :favorites, only: [:index, :delete]
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
