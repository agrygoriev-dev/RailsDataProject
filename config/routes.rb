# frozen_string_literal: true

Rails.application.routes.draw do
  get 'authors/index'
  get 'authors/show'
  get 'genres/index'
  get 'genres/show'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show', id: /\d+/

  root to: 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
