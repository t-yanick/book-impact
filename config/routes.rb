Rails.application.routes.draw do
  
  root 'opinions#index'

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :users, only: [:index, :show] 
  resources :opinions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
