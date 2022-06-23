Rails.application.routes.draw do
  devise_for :users
  # nao usa os registros
  devise_for :admins, skip: [:registrations], controllers: { sessions: 'admins/sessions' }

  namespace :admin do
    root to: 'home#index'
    resources :admins
  end

  root to: 'user/timeline#index'
  namespace :user do
    # resources :users
  end
end
