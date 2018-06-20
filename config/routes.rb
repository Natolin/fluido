Rails.application.routes.draw do

  # get 'lessons/index'
  # get 'lessons/show'
  # get 'lessons/new'
  # get 'lessons/edit'
  get 'languages/index'

  resources :users, only: [:edit, :update]
  resources :lessons

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
