Rails.application.routes.draw do

  get 'bookings/new'
  get 'bookings/edit'
  get 'dashboard', to: 'dashboards#dashboard'
  get 'languages/index'
  get 'teachers/about'
  # delete 'booking', to: 'bookings#destroy'

  resources :users, only: [:edit, :update]
  resources :lessons do
    resources :bookings, except: [:show]
  end

  # resources :bookings, only: [] do
  #   member do
  #     post "update_state"
  #   end
  # end

  devise_for :users
  root to: 'pages#home'
  get 'token', to: 'auths#token', :defaults => { :format => :json }

  resources :conversations do
    resources :messages
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
