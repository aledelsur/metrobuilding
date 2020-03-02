Rails.application.routes.draw do

  namespace :admin do
    resources :receipts
  end

  root 'site/properties#index'
  namespace :site do
    resources :payments, only: [:index]
    resources :receipts, only: [:index, :show]
    resources :properties, only: [:index, :show]
  end


  devise_for :users, skip: :registration

  get '/admin', to: 'admin/users#index'
  namespace :admin do
    resources :budgets, only: [:new, :create, :index, :destroy]
    resources :debts
    resources :users
    resources :properties
    resources :property_categories
    resources :payments
    resources :newsletters
  end
end
