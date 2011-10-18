Ieee::Application.routes.draw do
#  get "sessions/new"

  get "signup" => "users#new", :as => "signup"
  get "home" => "users#home", :as => "home"
  get "photos" => "photos#index", :as => "photos"
  get "users/edit" => "users#edit"
  
  scope :as => :statics do
    get 'about' => 'statics#about', :as => 'about'
    get 'hope' => 'statics#hope', :as => 'hope'
    get 'indrel' => 'statics#indrel', :as => 'indrel'
  end
  
  root :to => "users#home"
  
  scope 'users', :as => :users do
    resources :signups do
      post 'mark' => "signups#mark"
    end
  end
  
  scope :as => :sessions do
    get 'login' => 'sessions#new', :as => "login"
    get 'logout' => 'sessions#destroy', :as => "logout"
    post '/sessions' => 'sessions#create'
  end
  
  scope 'events', :as  => :events do
    get '/new' => 'events#new', :via => [:get,:post]
    post '/new' => 'events#create'
    get '/:id/edit' => 'events#edit', :via => [:get,:put,:delete]
    put '/:id/edit' => 'events#update'
    delete '/:id/edit' => 'events#destroy'
    get '/:id/show' => 'events#show', :as => :show
    
    scope '/:event_id/signups', :as => :signups do
      get '/new' => 'signups#new', :via => [:get,:post], :as => :new
      post '/:id/mark' => 'signups#mark', :as => :mark
    end
    
  end
  
#  resources :events
#  
#  
#  resources :events do
#    resources :signups
#  end
  resources :posts
  resources :photos, :only => [:show, :index]
end
