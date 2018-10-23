Rails.application.routes.draw do


  root to: 'home#top'

  resources :users, only: %i[index show edit update]
  get 'users/:id/doing', to: 'users#doing', as: 'doing'
  get 'users/:id/done', to: 'users#done', as: 'done'
  post 'change_status', to: 'users#change_task_status', as: 'change_task_status'
  get 'notification_login', to: 'users#notification_login'

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
      get :pv
      get :iine
      get :month_pv
      get :month_iine
      get :all_period_pv
      get :all_period_iine
    end
  end

  post 'tutorials/:id', to: 'tutorials#make_own_tutorial'
  get 'tags/:tag', to: 'tutorials#index', as: :tag

  # お問い合わせ
  get 'inquiries/new'
  post 'inquiries/confirm'
  post 'inquiries/complete'
end
