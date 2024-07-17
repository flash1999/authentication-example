Rails.application.routes.draw do
  get 'passwords/new'
  get 'passwords/create'
  get 'passwords/edit'
  get 'passwords/update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  #the 4 main controllers
  resource :session, only: [:new, :create, :destroy]
  resource :registration
  resource :password_reset, only: [:new, :create, :edit, :update]
  resource :password, only: [:new, :create, :edit, :destroy]

  #custom route for confirming reset (optional)
  get '/password_resets/confirm_reset/:token', to: 'password_resets#confirm_reset', as: 'confirm_reset'

  root 'main#index'
end
