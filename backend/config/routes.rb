Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 omniauth_callbacks: 'users/omniauth_callbacks',
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  resources :posts, only: [:index, :show, :create]
  resources :users, only: [:show, :update]
  get '/member-data', to: 'members#show'
end