Rails.application.routes.draw do

  root 'site/home#index'


  devise_for :users, skip: :registration

  namespace :admin do
    get '/', to: 'admin/payments#index'
    resources :budgets, only: [:new, :create, :index]
    resources :users
    resources :properties
    resources :property_categories
    resources :payments
  end
end
