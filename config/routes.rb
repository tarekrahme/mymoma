Rails.application.routes.draw do
  get 'days/show'
  get 'days/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: :index
  resources :wallets, only: :show
  resources :goals, except: :index
  resources :transactions, only: [:show, :index]
  resources :days , only: [:show, :index]
end
