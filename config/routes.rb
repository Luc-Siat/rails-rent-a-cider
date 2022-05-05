Rails.application.routes.draw do
  # temp for front reasons

  root to: "ciders#index"
  devise_for :users
  resources :ciders do
    resources :reviews, only: [:create, :new]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
