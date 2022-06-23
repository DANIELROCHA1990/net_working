Rails.application.routes.draw do
  devise_for :users
  # nao usa os registros
  devise_for :admins, skip: [:registrations], controllers: { sessions: 'admins/sessions' }
  root to: 'admin/home#index'
  namespace :admin do
    root to: 'home#index'
    resources :admins
  end
end
