Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'

  root to: "ciders#index"
  devise_for :users
  resources :ciders

  #custom routes
  get 'profile', to: 'pages#profile', as: :profile

  #do
   # resources :reservations, only: [ :new, :create ]
   # resources :reviews, only: [ :new, :create ]
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "pages#home"

end
