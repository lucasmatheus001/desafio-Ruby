Rails.application.routes.draw do

  get 'dashboard/index'
  
  devise_for :users
  
  resources :accounts
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
