Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :availabilities, except: [:edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end

  get '/search/', :to => 'pages#search', :as => :search

end
