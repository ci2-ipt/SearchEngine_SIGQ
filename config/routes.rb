# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'front_page#index'

  get '/front_page', to: 'front_page#index'
end
