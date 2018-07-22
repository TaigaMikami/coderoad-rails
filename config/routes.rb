Rails.application.routes.draw do

  root to: 'home#top'

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # get "/auth/:provider/callback" => "users/omniauth_callbacks#github"
end
