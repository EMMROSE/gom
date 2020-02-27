Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :activities, only: [:index]
  resources :sport_sessions, only: [:index, :show, :new, :create, :edit, :update] do
    resources :session_users, only: [:new, :create]
    resources :chatrooms, only: [:show] do
      resources :messages, only: :create
    end
  end
  resources :session_users, only: [:edit, :update] do
    member do
      get :accept
      get :reject
    end
  end
  get 'dashboards', to: 'dashboards#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

