Rails.application.routes.draw do
  root 'home#index'
  
  
  resources :books
  resources :library, only:[:index]
end
