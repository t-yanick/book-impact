Rails.application.routes.draw do
 
  root 'opinions#index'
  # root 'devise/sessions#new'

  devise_for :users, controllers: { registrations: "users/registrations" }
  # devise_scope :user do
  #   root to: 'devise/sessions#new'
  # end

  resources :users, only: [:index, :show] 
  resources :followings, only: %[destroy]

  get 'following/:id', to: 'followings#create', as: 'follow'
  resources :opinions do
    resources :comments, only: %i[create]
    resources :likes, only: %i[create destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
