Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      confirmations: 'user/confirmations',
      #omniauth_callbacks 'user/omniauth_callbacks',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      sessions: 'users/sessions', 
      unlocks: 'user/unlocks',
    }, only: [:confirmation,:password,:registration, :session, :unlock]

  root to:'users#index'
  resources :users, only: [:show,:index,:edit,:update]
  resources :shops do
    resources :reviews
  end
end
