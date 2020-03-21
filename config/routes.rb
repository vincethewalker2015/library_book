Rails.application.routes.draw do
  root 'home#index'
  root to: 'books#index'
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  
  resources :books
  resources :library, only:[:index]
end
