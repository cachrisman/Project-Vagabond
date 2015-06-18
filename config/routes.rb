Rails.application.routes.draw do

  get 'cities/index'

  get 'cities/show'

  root to: "sessions#index"
  get '/login', to: "sessions#new"

  get "/about", to: "site#about"
  get "/contact", to: "site#contact"

  post "/sessions", to: "sessions#create"
  get '/logout', to: "sessions#logout"
  get "/signup", to: "users#new"

  get '/cities', to: 'cities#index', as: 'cities'
  get '/cities/:id', to: 'cities#show', as: 'city'

  # get '/cities/:city_id/log_posts', to: "cities#show", as: "city_log_posts"
  resources :log_posts
  put '/users/:id/follow', to: 'users#follow', as: 'user_follow'
  resources :users


end
