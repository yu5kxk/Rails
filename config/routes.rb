Rails.application.routes.draw do

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only: [:new, :index, :show, :edit, :update, :destroy]
  post "/books/new" => "books#create", as: "booknew"
  resources :users, only: [:show, :index, :edit, :update, :new]

  root 'books#index'

end
