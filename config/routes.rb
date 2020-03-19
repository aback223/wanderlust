Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root'welcome#home'

  get '/privacy', to: 'welcome#privacy'

  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: 'register'
    get 'login', to: 'devise/sessions#new', as: 'login'
  end
  
  resources :users, only: [:show] do
    resources :itineraries
  end
  post '/users/:user_id', to: 'itineraries#create'

  resources :memberships, only: [:create, :show, :index]
  resources :invites

  resources :itineraries, only: [:show] do
    resources :days
    resources :images, only: [:new, :create, :destroy]
  end

  resources :days, only: [:show] do
    resources :activities
  end

  resources :activities, only: [:edit, :update, :destroy]

  get '/welcome', to: 'itineraries#index', as: 'welcome'

end
