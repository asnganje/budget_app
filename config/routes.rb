Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :groups do
    resources :operations
  end
  get "dashboard", to: "dashboard#index"
  get "close_modal", to: "groups#close_modal"
end
