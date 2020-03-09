Rails.application.routes.draw do

  namespace :admin do
    resources :receipts
  end

  root 'site/properties#index'
  namespace :site do
    resources :payments, only: [:index]
    resources :receipts, only: [:index, :show]
    resources :properties, only: [:index, :show]
    resources :newsletters
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
    resources :media_assets, only: [:index, :create, :destroy]
    resources :newsletters do
      resources :newsletter_sections
      delete '/newsletter_section/:id', to: 'newsletters#remove_section', as: 'remove_section'
      put '/sort_sections', to: 'newsletters#sort_sections', as: 'sort_sections'
      get '/send_newsletter', to: 'newsletters#send_newsletter', as:'send_newsletter'
    end
  end
end
