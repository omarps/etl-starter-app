Rails.application.routes.draw do
  resources :channel_rates
  resources :client_applications
  resources :controls
  resources :discount_plans
  resources :discounts
  resources :invoiceable_fees
  resources :unit_amenities
  resources :unit_groups
  resources :unit_types
  resources :units
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'etls#index'
end
