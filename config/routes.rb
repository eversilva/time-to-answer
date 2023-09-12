Rails.application.routes.draw do

  devise_for :users
  devise_for :admins

  namespace :website do
    get  'welcome/index'
    get  'search', to: 'search#questions' 
    post 'answer', to: 'answer#question'
  end
  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins    # Administradores
    resources :subjects  # Assuntos
    resources :questions # Questões
  end

  get 'inicio', to: 'website/welcome#index'

  root to: 'website/welcome#index'
end
