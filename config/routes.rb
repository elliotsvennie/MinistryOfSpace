Rails.application.routes.draw do
  get 'companies/index'

  get 'companies/new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    
  scope ':city' do
    resources :companies, path: "looking", only: [:index, :new, :create], path_names: { new: 'add' }
    resources :spaces, path: "", only: [:index, :show, :new, :create], path_names: { new: 'add' }
  end
  
  root to: "cities#index"
end
