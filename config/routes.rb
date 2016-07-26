Rails.application.routes.draw do



  # admins
  devise_for :admins
  resources :admins, only: [:show]

  as :admin do
    get 'admins', :to => 'admins#show', :as => :admin_root
  end

  # apps
  resources :apps do
    member do
      get 'settings'
    end
  end


  # api
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [:create]
    end
  end


  root 'welcome#index'

end

