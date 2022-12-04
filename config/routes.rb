Rails.application.routes.draw do

  get 'dashboard/index'
  
  devise_for :users
  
  resources :accounts do
    collection do
      get '/deposito', action: 'deposito'
      post '/create_deposito', action: 'create_deposito'
      get '/transfer', action: 'transfer'
      post '/create_transfer', action: 'create_transfer'
      get '/withdraw', action: 'withdraw'
      post '/create_withdraw', action: 'create_withdraw'
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get "pages/home"
end
