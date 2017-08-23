Rails.application.routes.draw do

  post 'books/create' ,to: 'books#create', as: 'create_book'
  get  'books', to: 'books#list', as: 'book_list'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'dashboard', to: 'home#dashboard', as: 'dashboard'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
