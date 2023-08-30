Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:inde, :new, :create, :show, :edit, :update]
end
