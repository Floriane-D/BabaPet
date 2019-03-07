Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :availabilities, except: [:edit, :update, :destroy] do
    resources :bookings, only: [:index, :new, :create]
  end
end
