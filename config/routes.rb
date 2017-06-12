Rails.application.routes.draw do


  resources :comments
  resources :albums do
    resources :photos
  end
  get 'person/profile'

  root to: "person#profile"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/update' => 'registrations#update'
  end

  devise_for :users, :controllers => { registrations: 'registrations' }

end
