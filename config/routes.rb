Rails.application.routes.draw do
  resources :books
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'books#index'
  get '/requests/:book_id', to: 'requests#index', as: ' /books/requests'
  post '/requests/:book_id', to: 'requests#create', as: 'request'
  resources :users, only: [:index, :show]
end
