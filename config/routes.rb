Rails.application.routes.draw do

  root 'welcome#index'
  devise_for :admins
  resources :admins, only: [:show]

  as :admin do
    get 'admins', :to => 'admins#show', :as => :admin_root
  end

end
