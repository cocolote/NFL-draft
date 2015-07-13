Rails.application.routes.draw do
  root 'turns#index'

  resources :turns, only: [:update]
  resources :positions, only: [:show]
  resources :players, only: [:index]
end
