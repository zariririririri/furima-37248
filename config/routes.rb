Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  
  resources :products do
   resources :buys,  only: [:create, :index]
  end
end 
