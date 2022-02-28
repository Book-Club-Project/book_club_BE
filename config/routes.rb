Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/books/search', to: 'books#search'
      resources :books, only: [:index, :show]

      resources :users, only: [:index, :show, :create] do
        resources :clubs, only: [:index], controller: 'user_clubs'
      end
      
      resources :clubs, only: [:index, :show, :create]
    end
  end
end
