Rails.application.routes.draw do

  root 'site/home#index'


  devise_for :users, skip: :registration

  get '/admin', to: 'admin/payments#index'
  namespace :admin do
    resources :budgets, only: [:new, :create, :index, :destroy]
    resources :users
    resources :properties
    resources :property_categories
    resources :payments
  end
end
