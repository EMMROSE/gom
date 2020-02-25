Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :activities, only: [:index]
  resources :sport_sessions, only: [:index, :show, :new, :create, :edit, :update]
  get 'dashboards', to: 'dashboards#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
