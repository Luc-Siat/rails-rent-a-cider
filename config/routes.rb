Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  resources :ciders do
    resources :reviews, only: [:create, :new]
    resources :reservations, only: [:create, :new, :edit]
  end

  #custom routes
  get 'profile', to: 'pages#profile', as: :profile
  get 'team', to: 'pages#team', as: :team
  get 'careers', to: 'pages#careers', as: :careers
  get 'cgv', to: 'pages#cgv', as: :cgv
  #do
   # resources :reservations, only: [ :new, :create ]
   # resources :reviews, only: [ :new, :create ]
  #end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
