Rails.application.routes.draw do
  root to: "ciders#index"
  devise_for :users
  resources :ciders do
    resources :reviews, only: [:create, :new]
    resources :reservations, only: [:create, :new]
  end

  #custom routes
  get 'profile', to: 'pages#profile', as: :profile

  #do
   # resources :reservations, only: [ :new, :create ]
   # resources :reviews, only: [ :new, :create ]
  #end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
