Rails.application.routes.draw do

  devise_for :admin_users
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  default_url_options :host => "localhost:3000"

  namespace :admin do
    resources :receipts
  end

  root 'site/properties#index'

  namespace :site do
    resources :payments, only: [:index]
    resources :receipts, only: [:index, :show]
    resources :properties, only: [:index, :show]
    resources :sent_newsletters, only: [:show]
  end

  devise_for :users, skip: :registration

  get '/admin', to: 'admin/users#index'
  namespace :admin do
    resources :budgets
    resources :debts
    resources :users do
      get 'newsletters_history', to: 'users#newsletters_history', as: 'newsletters_history'
    end
    resources :properties
    resources :property_categories
    resources :payments
    resources :media_assets
    resources :newsletter_variables, only: [:index]
    resources :newsletters do
      resources :newsletter_sections do
        get 'media_assets', to: 'newsletter_sections#media_assets'
        put 'add_media_asset', to: 'newsletter_sections#add_media_asset'
        delete 'remove_media_asset', to: 'newsletter_sections#remove_media_asset'
      end
      put '/sort_sections', to: 'newsletters#sort_sections', as: 'sort_sections'
      put '/send_newsletter', to: 'newsletters#send_newsletter', as:'send_newsletter'
    end
  end
end
