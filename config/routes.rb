Rails.application.routes.draw do

  get 'person/profile'

  root to: "person#profile"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users, :controllers => { registrations: 'registrations' }

end
