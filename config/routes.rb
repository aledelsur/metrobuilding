Rails.application.routes.draw do

  root 'site/home#index'


  devise_for :users, skip: :registration

  namespace :admin do
    resources :budgets, only: [:new, :create, :index]
    resources :users
    resources :properties
    resources :property_categories
    resources :payments
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
