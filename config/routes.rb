Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :groups
  get "dashboard", to: "dashboard#index"
end
