Rails.application.routes.draw do
  resources :posts
  resources :boards do
    resources :posts
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'

  #intro routes
  get '/intro/intro', to: 'intro#intro'
  get '/intro/rules', to: 'intro#rules'
  get '/intro/history', to: 'intro#history'
  get '/intro/slogan', to: 'intro#slogan'
  get '/intro/partner', to: 'intro#partner'
end
