Rails.application.routes.draw do
  
  root to: 'pages#home'
  devise_for :users
  resources :users do
    resource :profile
    resources :plants
    resources :lights
  end
  get 'garden', to: 'users#garden'
  get 'about', to: 'pages#about'
end
