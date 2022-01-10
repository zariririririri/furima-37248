Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  
  resources :products,  only: [:index, :new, :create, :show, :edit, :update] do
  end
end 
 