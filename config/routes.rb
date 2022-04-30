Rails.application.routes.draw do
  # temp for front reasons
  root to: "pages#home"
  devise_for :users
  resources :ciders
  #do
   # resources :reservations, only: [ :new, :create ]
   # resources :reviews, only: [ :new, :create ]
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "pages#home"

end
