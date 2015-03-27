Rails.application.routes.draw do
  root 'restaurants#index'

  resources :restaurants

  resources :restaurants do
    resources :reviews, only: [:index, :new, :create, :show]
  end

  resources :restaurants
end
