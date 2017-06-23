Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/update' => 'registrations#update'
  end

  get 'person/profile'
  get '/users/:user_id', to: 'albums#index'

  root to: "person#profile"

  resources :tags
  resources :users do
    resources :albums do
      resources :photos do
        resources :comments
      end
    end
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]
end
