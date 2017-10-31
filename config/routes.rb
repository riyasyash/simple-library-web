Rails.application.routes.draw do

  post 'books/create' ,to: 'books#create', as: 'create_book'
  get  'books', to: 'books#list', as: 'book_list'
  post 'books/:isbn/checkout', to: 'books#checkout', as: 'checkout_book'
  delete 'books/:isbn/return', to: 'books#return_book', as: 'return_book'
  get  'books/:isbn/request',to: 'books#request_book', as: 'request_book'
  get  'books/:isbn/users', to: 'books#list_book_users', as: 'list_book_users'

  get 'auth/:provider/callback', to: 'sessions#create'
  # get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'index', to: 'home#index', as: 'index'
  get 'dashboard', to: 'home#dashboard', as:'dashboard'

  post 'notifications/:userId', to: 'notifications#create', as: 'create_notification'
  get  'notifications/:userId', to: 'notifications#list', as: 'list_notification'
  delete 'notifications/:id', to: 'notifications#delete', as: 'delete_notification'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
