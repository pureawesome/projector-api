Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'auth#authenticate'
  post 'register', to: 'auth#register'
  get 'language', to: 'translations#language'
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  resources :password_resets, only: [:create, :update]
  resources :projects, only: [:index, :show, :create, :update, :destroy] do
    resources :tasks, only: [:show]
  end
  resources :users
  resources :bookings
  resources :resources
  resources :translations, only: [:index, :create]
end
