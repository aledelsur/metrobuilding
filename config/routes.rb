Rails.application.routes.draw do

  root 'users#index'
  resources :users
  resources :properties
  resources :property_categories
  resources :payments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
