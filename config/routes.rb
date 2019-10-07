Rails.application.routes.draw do
#   devise_for :users

  get 'welcome/index'
  
  resources :articles
  get 'custom/cc', to: 'custom#cc'

  root 'welcome#index'

  get '*path', to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
