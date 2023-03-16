Rails.application.routes.draw do
  # get 'sessions/create'
  # get 'users/index'
  # get 'users/create'
  # get 'users/login'
  # get 'users/forget_password'
  # get 'users/reset_password'
  # get 'users/logout'
  # get 'users/destroy'
  # get 'tournaments/index'
  # get 'tournaments/show'
  # get 'tournaments/create'
  # get 'tournaments/update'
  # get 'tournaments/destroy'
  # get 'players/index'
  # get 'players/show'
  # get 'players/create'
  # get 'players/update'
  # get 'players/destroy'
  # get 'teams/index'
  # get 'teams/show'
  # get 'teams/create'
  # get 'teams/update'
  # get 'teams/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :teams, only: [:index, :show, :create, :update, :destroy]
   
  # get "join"=> "teams#join"

  # get "index" => "teams#index"


  resources :tournaments, only: [:index, :show, :create, :update, :destroy]
 
  # get "max_order" => "tournaaments#max_order"
  # get "paginate"=> "tournaaments#paginate"


  resources :players, only: [:index, :show, :create, :update, :destroy]
  
  # patch "players/update" => "players#update"
  # delete "players/delete" => "players#delete"

  get "search" => "players#search"
  
  # post "create" => "sessions#create"
  
  # Defines the root path route ("/")
  # root "articles#index"

  # resources :users
  get "index" => "users#index"
  # get "create" => "users#create"
  post "/create" => "users#create"
  post "login" => "users#login"
  post "forget_password" => "users#forget_password"
  post "reset_password" => "users#reset_password"
  post "logout" => "users#logout"

  # Defines the root path route ("/")
  # root "articles#index"
end
