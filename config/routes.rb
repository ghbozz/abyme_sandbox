Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, only: %i(index show create edit update destroy)

  # AJAX CALLS
  post 'project_validation', to: 'projects#project_validation'

  root to: 'projects#index'
end
