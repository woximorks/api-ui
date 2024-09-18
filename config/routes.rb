Rails.application.routes.draw do
  get 'pages/index'
  get 'home', to: 'pages#home'
  get 'search', to: 'pages#index'
  get 'actionlog', to: 'pages#actionlog'
  get 'agent', to: 'pages#agent'
  get 'brand', to: 'pages#brand'
  get 'buyertransaction', to: 'pages#buyertransaction'
  get 'company', to: 'pages#company'
  get 'contact', to: 'pages#contact'
  get 'emailcampaign', to: 'pages#emailcampaign'
  get 'event', to: 'pages#event'
  get 'gallery', to: 'pages#gallery'
  get 'group', to: 'pages#group'
  get 'leadsource', to: 'pages#leadsource'
  get 'index', to: 'pages#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#index"
end
