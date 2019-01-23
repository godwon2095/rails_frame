Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations", confirmations: "users/confirmations", passwords: "users/passwords", omniauth_callbacks: 'users/omniauth_callbacks'}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
