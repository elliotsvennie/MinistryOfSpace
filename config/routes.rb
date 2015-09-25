Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    
  scope ':city' do
    resources :spaces, path: "", only: [:index, :show, :new, :create], path_names: { new: 'add' }
  end
  
  root to: "cities#index"
end
