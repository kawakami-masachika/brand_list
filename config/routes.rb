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

    devise_scope :user do
      get 'user/quit', to: 'users/registrations#quit'
    end

  root to:'shops#index'
  get   '/users', to: 'users#notfound'
  resources :users, only: [:show,:edit,:update] do
    member do 
      get :shops 
      get :reviews
      get :option
    end
  end
  resources :shops do
    collection do
      get 'search'
      post 'search'
    end
      resources :reviews
  end
  resources :tags, only: [:index, :show, :destroy]
end
