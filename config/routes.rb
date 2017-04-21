Rails.application.routes.draw do
  devise_for :users
  root controller: :index, action: :index

  resources :news, only: [:new, :create]

  resources :help_requests, only: [:index]
  resources :facilities, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/registrations'
      }
      resources :news, only: [:index], defaults: { format: 'json' }
      resources :facilities, only: [:index], defaults: { format: 'json'}
      resources :help_requests, only: [:create], defaults: { format: 'json' }
    end
  end
end
