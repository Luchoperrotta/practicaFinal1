Rails.application.routes.draw do
  devise_for :users
  resources :current_accounts
  resources :user_accounts
  resources :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  root to: "current_accounts#index"
end
