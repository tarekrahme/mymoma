Rails.application.routes.draw do
  get 'days/show'
  get 'days/index'
  devise_for :users
  root to: 'pages#home'
  get "/profile", to: "users#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: :index
  resources :wallets, only: [:show, :create ]do
    collection do
      get 'tell_us_a_bit_more', to: 'wallets#tell_us_a_bit_more'
      get 'recommendations', to: 'wallets#recommendations'
    end
  end
  resources :goals, except: :index
  resources :transactions, only: [:show, :index]
  resources :days , only: [:show, :index]
end
