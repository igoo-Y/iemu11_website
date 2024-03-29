Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'

  #intro routes
  get '/intro/intro', to: 'intro#intro'
  get '/intro/rules', to: 'intro#rules'
  get '/intro/history', to: 'intro#history'
  get '/intro/slogan', to: 'intro#slogan'
  get '/intro/partner', to: 'intro#partner'

  #matches routes
  resources :matches
  get '/match/table', to: 'matches#table'

  #boards & posts routes
  resources :posts
  resources :boards do
    resources :posts
  end
  resources :boards

  #volunteer routes
  resources :volunteers
  get '/volunteer/activity', to: 'volunteers#activity'
  get '/volunteer/volunteer_history', to: 'volunteers#volunteer_history'

  resources :members
  resources :tables

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
