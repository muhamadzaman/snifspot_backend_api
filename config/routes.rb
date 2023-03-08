Rails.application.routes.draw do
  resources :spots, only: [:index, :show, :create, :update]
  resources :reviews, only: [:create, :update]
end
