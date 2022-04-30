Rails.application.routes.draw do
  # temp for front reasons
  root to: "pages#home"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

end
