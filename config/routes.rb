Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/books/search', to: 'books#search'
      resources :books, only: [:index, :show]
    end
  end
end
