Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :sites, only: :index
  resources :zones, only: :index
  resources :users
  resources :surveys do
    resources :checklists
  end
  resources :trackings, only: [:index]
  post '/users', to: 'users#create'

  resources :work_orders do
    get 'assign_user', on: :member
  end
end
