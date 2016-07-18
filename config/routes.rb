Rails.application.routes.draw do
  resources :reviews
  resources :goals
  resources :users
  root to: 'goals#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  namespace :api do
    namespace :v1 do
      resources :goals, only: [:index, :show]
    end
  end
end
