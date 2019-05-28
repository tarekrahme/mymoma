Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'registrations'}
  authenticated do
    root to: 'wallets#show'
  end
  root to: "pages#landing"
  get "/profile", to: "user#show"
  get "/questions", to: "pages#questions"
  get "home", to: "pages#home"
  get 'landing', to: "pages#landing"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: :index
  resources :wallets, only: [:show, :create, :edit, :update ]do
    collection do
      get 'tell_us_a_bit_more', to: 'wallets#tell_us_a_bit_more'
      get 'recommendations', to: 'wallets#recommendations'
    end
  end
  resources :goals, except: :index
  resources :transactions
  resources :days , only: [:show, :index]
end
