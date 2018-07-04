Rails.application.routes.draw do

  namespace :admin do
    resources :receipts
  end

  root 'site/home#index'
  namespace :site do
    resources :receipts, only: [:index, :show]
  end


  devise_for :users, skip: :registration

  get '/admin', to: 'admin/users#index'
  namespace :admin do
    resources :budgets, only: [:new, :create, :index, :destroy]
    resources :users
    resources :properties
    resources :property_categories
    resources :payments
  end
end
