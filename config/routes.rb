Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  get 'search_suggestions', to: 'search_suggestions#index'
  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/update' => 'registrations#update'
  end

  get 'person/profile'
  get 'person/followers'
  get '/users/:user_id', to: 'albums#index'

  root to: "person#profile"

  resources :tags, only: [:show]

  resources :users do
    member do
      get :following, :followers, :relations
    end
    resources :albums do
      resources :photos do
        resources :comments
      end
    end
  end

  get 'search', to: 'searches#search'

  resources :relationships, only: [:create, :destroy]

  mount ActionCable.server => '/cable'
end
