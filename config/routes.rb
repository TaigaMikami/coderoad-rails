Rails.application.routes.draw do

  root to: 'home#top'

  resources :users, only: %i[index show]

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :tutorials

  namespace :tutorials do
    namespace :ranks do
      get :pv_rank
      get :iine_rank
    end
  end

  post 'tutorials/:id', to: 'tutorials#make_own_tutorial'
  get 'tags/:tag', to: 'tutorials#index', as: :tag

end
