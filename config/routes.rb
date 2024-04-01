Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'

  root 'top#top'

  get 'login', to: 'user_sessions#new' #login_pathが使えるようになり、login_pathが使われるとログイン画面（'user_sessions#new'）に移動する
  post 'login', to: 'user_sessions#create' #login_path('user_sessions#new')からのデータを'user_sessions#create'へ受け取って、データベースに保存
  delete 'logout', to: 'user_sessions#destroy' #logout_pathが使えるようになる。削除処理を行う。

  post 'box_pokemons/select', to: 'box_pokemons#select'
  post 'box_pokemons/change', to: 'box_pokemons#change'

  resources :users, only: %i[index new create edit update]
  resource :profile, only: %i[show edit update]
  resources :pokemons, only: [:index]
  resources :pokemons do
    get :search, on: :collection
  end
  resources :box_pokemons, only: [:index]
  resources :box_pokemons do
    get :search, on: :collection
  end
  resources :pokemon_books, only: [:index]
  resources :individual_pokemon_types, only: [:index]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :notifications, only: [:index]
  delete 'destroy_all_users_notifications', to: 'notifications#destroy_all'

  namespace :admin do
    get 'user_sessions/new'
    get 'sessions/new'
    get 'dashboards/index'
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    post 'reset_match_limit', to: 'dashboards#reset_match_limit'
    resources :distribute, only: %i[index new create edit update destroy]
  end


  get 'user_pokemon_matches/standby', to: 'user_pokemon_matches#standby'
  get 'user_pokemon_matches/battle', to: 'user_pokemon_matches#battle'
  get 'user_pokemon_matches/result', to: 'user_pokemon_matches#result'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
