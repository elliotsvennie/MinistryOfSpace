Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get "add", to: "spaces#new", as: "new_space"
  post "add", to: "spaces#create"
  get ":slug", to: "spaces#show", as: "space"
  root to: "spaces#index"
end
