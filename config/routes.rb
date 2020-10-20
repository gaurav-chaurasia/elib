Rails.application.routes.draw do
  resources :books
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'books#index'
  get '/requests/:book_id', to: 'requests#index', as: 'requests'
  post '/requests/:book_id', to: 'requests#create', as: 'req'
  put '/request/approve/:id', to: 'requests#approve', as: 'approve'
  put '/request/reject/:id', to: 'requests#reject', as: 'reject'
  put '/request/return/:id', to: 'requests#return', as: 'return'


  resources :users, only: [:index, :show]
  get 'dashboard/:id', to: 'users#dashboard', as: 'dashboard'
  get 'admin_dashboard/:id', to: 'users#admin', as: 'admin_dashboard' 

end
