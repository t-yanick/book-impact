Rails.application.routes.draw do
 
  root 'opinions#index'

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :users, only: [:index, :show] 
  resources :followings, only: %[destroy]

  get 'following/:id', to: 'followinngs#create', as: 'follow'
  resources :opinions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
