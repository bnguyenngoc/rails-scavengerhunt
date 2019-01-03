# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#main'
  get 'pages/main'

  # These routes will be for signup. The first renders a form in the browse, the second will
  # receive the form and create a user in our database using the data given to us by the user.
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#edit'
  put '/users/:id' => 'users#update'

  # these routes are for showing users a login form, logging them in, and logging them out.
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # routes for challenges
  resources :challenges do
    member do
      get 'show', to: 'teams_challenges#show'
      match 'submit' => 'teams_challenges#submit', as: :submit, via: %i[post put patch]
    end
  end

  resources :teams_challenges, only: %i[index edit]
  # routes for teams
  resources :teams do
    member do
      post 'join', to: 'teams_relationships#join'
      post 'leave', to: 'teams_relationships#leave'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
