Rails.application.routes.draw do
  root 'opinions#index'

  devise_for :users

  resources :users, only: %i[index show]
  resources :followings, only: %(destroy)

  get 'following/:id', to: 'followings#create', as: 'follow'
  resources :opinions do
    resources :comments, only: %i[create]
    resources :likes, only: %i[create destroy]
  end
end
