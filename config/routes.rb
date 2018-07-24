Rails.application.routes.draw do

  root to: 'home#top'

  resources :users

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :tutorials
  get 'tags/:tag', to: 'tutorials#index', as: :tag

end
