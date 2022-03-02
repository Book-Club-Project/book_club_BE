Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/authenticate', to: 'authentications#authenticate'

      get '/books/search', to: 'books#search'
      get '/quote', to: 'quotes#index'
      resources :books, only: [:index, :show]

      resources :users, only: [:index, :show, :create] do
        resources :clubs, only: [:index], controller: 'user_clubs'
      end

      resources :clubs, only: [:index, :show, :create] do
        resources :users, only: [:index], controller: 'club_users'
        resources :comments, only: [:index], controller: 'club_comments'
      end

      resources :comments, only: [:index, :create]
    end
  end
end
