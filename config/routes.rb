Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace :website do
    get 'welcome/index'
  end
  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
  end

  get 'inicio', to: 'website/welcome#index'

  root to: 'website/welcome#index'
end
