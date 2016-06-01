Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'auth#authenticate'
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  resources :password_resets, only: [:create, :update]
  resources :projects, only: [:index, :show, :create, :update, :destroy] do
    resources :tasks
  end
  resources :users
  resources :bookings
  resources :resources
end
