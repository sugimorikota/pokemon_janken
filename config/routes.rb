Rails.application.routes.draw do

  root 'top#index'

  get 'login', to: 'user_sessions#new' #login_pathが使えるようになり、login_pathが使われるとログイン画面（'user_sessions#new'）に移動する
  post 'login', to: 'user_sessions#create' #login_path('user_sessions#new')からのデータを'user_sessions#create'へ受け取って、データベースに保存
  delete 'logout', to: 'user_sessions#destroy' #logout_pathが使えるようになる。削除処理を行う。

  post 'box_pokemons/select', to: 'box_pokemons#select'

  resources :users, only: %i[new create]
  resources :pokemons, only: [:index]
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
