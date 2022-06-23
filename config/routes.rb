Rails.application.routes.draw do
  # nao usa os registros
  devise_for :admins, skip: [:registrations], controllers: { sessions: 'admins/sessions' }

  namespace :admin do
    root to: 'home#index'
    resources :admins
  end
end
