Rails.application.routes.draw do
  root 'home#index'
  root to: 'books#index'
  devise_for :users, controllers: { registrations: "registrations" }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  
  resources :books do 
    member do 
      put "add", to: "books#library"
      put "remove", to: "books#library"
    end
  end
  resources :library, only:[:index]
  resources :pricing, only:[:index]
  resources :subscriptions
end
