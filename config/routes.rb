Rails.application.routes.draw do
  
  root 'sessions#home'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create' 

  delete 'logout' => 'sessions#destroy'
  
  get "/auth/google_oauth2/callback" => 'sessions#google'

  resources :users do
    resources :songs, only: [:new, :create, :index]
    resources :setlists, only: [:index]
  end
  
  resources :setlists do
    resources :songs, only: [:new, :create, :index]
    resources :song_selections, only: [:new, :create, :index]
    resources :setlist_permissions, only: [:index, :new, :create, :edit]
  end

  resources :songs

  resources :setlist_permissions

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
