# frozen_string_literal: true

Rails.application.routes.draw do
  get '/authors', to: 'authors#index'
  get '/authors/:id', to: 'authors#show', id: /\d+/

  get '/genres', to: 'genres#index'
  get '/genres/:id', to: 'genres#show', id: /\d+/

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show', id: /\d+/

  root to: 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
