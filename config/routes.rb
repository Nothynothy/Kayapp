Rails.application.routes.draw do
  devise_for :users
  root to: 'topos#index'
  resources :topos, only: [:index, :show] do
    resources :comments, only: [:create, :update]
    post :toggle_favorite, on: :member
    get :river_data, on: :member
  end
  resources :favorites, only: [:index, :delete]
  resources :users, only: [:show]
  resources :addresses, only: [:index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
