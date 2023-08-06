Rails.application.routes.draw do
  devise_for :users
  namespace :website do
    get 'welcome/index'
  end
  namespace :profiles_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
  end
  devise_for :admins

  get 'inicio', to: 'website/welcome#index'

  root to: 'website/welcome#index'
end
