Rails.application.routes.draw do
  
  root to: 'pages#home'
  devise_for :users
  resources :users do
    resource :profile
    resources :plants
  end
  get 'about', to: 'pages#about'
end
