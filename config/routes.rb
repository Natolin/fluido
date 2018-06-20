Rails.application.routes.draw do
  
  get 'languages/index'

  resources :users, only: [:edit, :update]
  resources :lessons

  devise_for :users
  root to: 'pages#home'

  resources :conversations do 
    resources :messages 
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
