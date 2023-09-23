Rails.application.routes.draw do

  devise_for :users
  devise_for :admins, skip: [:registration]

  namespace :website do
    get  'welcome/index'
    get  'search', to: 'search#questions'
    get  'subject/:subject_id', to: 'search#subject', as: 'search_subject' 
    post 'answer', to: 'answer#question'
  end
  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins    # Administradores
    resources :subjects  # Assuntos
    resources :questions # Questões
  end

  get 'inicio', to: 'website/welcome#index'
  get 'admin', to: 'admins_backoffice/welcome#index'

  root to: 'website/welcome#index'
end
