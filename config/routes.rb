Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'

  root to: "ciders#index"
  devise_for :users
  resources :ciders

  #custom routes
  get 'user/:id', to: 'user#profile', as: :profile
  get 'user/:id/ciders', to: 'user#ciders', as: :user_ciders

  #do
   # resources :reservations, only: [ :new, :create ]
   # resources :reviews, only: [ :new, :create ]
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "pages#home"

end
