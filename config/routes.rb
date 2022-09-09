Rails.application.routes.draw do
  root to: 'posts#index'
  resources :comments
  resources :posts
  devise_for :users
  get 'profile', to: 'profiles#show', as: :profile
end
