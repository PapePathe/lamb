Ndefleng::Application.routes.draw do




  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :combats, :only => [:index], :path => 'combats-de-lutte-sengalaise'  do
    member do
      get :watch
      post :note
    end
  end

  resources :users, :only => [:new, :create, :index, :show], :path => 'amateurs-de-lutte'
  
  resources :lutteurs, :only => [:index, :show]
  
  resources :promoteurs, :only => [:index, :show], :path => 'promoteurs-de-lutte'
  
  resources  :ecuries, :only => [:index, :show], :path => 'ecuries-et-ecoles-de-lutte'
  
  resources :galas, :only => [:index, :show], :path => 'galas-de-lutte'
  
  resources :sessions, :only => [:new, :create], :path => 'sessions-amateurs-de-lutte'
  
  
  get "deconnexion" => 'sessions#destroy', :as => :deconnexion
  
  get "calendrier-de-la-saison" => "calendrier#index", :as => :calendar


  
  root :to => 'ndefleng#index'

  
  ActiveAdmin.routes(self)
  
end
