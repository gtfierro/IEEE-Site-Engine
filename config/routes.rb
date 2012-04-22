Ieee::Application.routes.draw do
#  get "sessions/new"

  get "signup" => "users#new", :as => "signup"
  get "home" => "users#home", :as => "home"
  get "photos" => "photos#index", :as => "photos"
  get "users/edit" => "users#edit"
  get "calendar" => "events#calendar", :as => "calendar"
  get "hope" => "hope#about", :as => "hope/about"
  get "about" => "about#information", :as => "about/information"

  scope :as => :statics do
    get 'scope' => 'statics#scope', :as => 'scope'
    get 'indrel' => 'statics#indrel', :as => 'indrel'
    get 'subscribe' => 'statics#subscribe', :as => 'subscribe'
  end

  scope "hope", :as => :hope do
    get 'about' => 'hope#about', :as => 'about'
    get 'programs' => 'hope#programs', :as => 'programs'
    get 'resources' => 'hope#resources', :as => 'resources'
    get 'faq' => 'hope#faq', :as => 'faq'
  end
  
  scope "about", :as => :about do
    get 'information' => 'about#information', :as => 'information'
	get 'officers' => 'about#officers', :as => 'officers'
	get 'advisor' => 'about#advisor', :as => 'advisor'
	get 'contact' => 'about#contact', :as => 'contact'
  end

  root :to => "users#home"

  scope 'users', :as => :users do
    get '/new' => 'users#new', :as => :new
    post '/new' => 'users#create', :as => :create
    get '/:id/edit' => 'users#edit', :as => :edit
    put '/:id/edit' => 'users#update', :as => :update
    delete '/:id/destroy' => 'users#destroy', :as => :destroy

    scope '/:user_id/signups' do
      post '/:id/mark' => 'signups#mark', :as => :mark
    end
  end

  scope :as => :sessions do
    get 'login' => 'sessions#new', :as => "login"
    get 'logout' => 'sessions#destroy', :as => "logout"
    post '/sessions' => 'sessions#create'
  end

  scope 'events', :as  => :events do
    scope '/:event_id/signups', :as => :signups do
      get '/new' => 'signups#new', :as => :new
      post '/new' => 'signups#create', :as => :create
      post '/:id/mark' => 'signups#mark', :as => :mark
    end
  end

  resources :events
  resources :posts
  resources :photos, :only => [:show, :index]
end
