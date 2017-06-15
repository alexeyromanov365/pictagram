Rails.application.routes.draw do

  get 'person/profile'

  root to: "person#profile"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/update' => 'registrations#update'
  end
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :tags
  resources :users do
    resources :albums do
      resources :photos do
        resources :comments
      end
    end
  end

end
