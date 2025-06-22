Rails.application.routes.draw do
  devise_for :users

  get '/guests', to: redirect('/guests.html')
  root 'activities#index'
  
  resources :activities, only: %i[index create update destroy]
  resources :welcome, controller: :welcome, only: :index
  resources :users, only: %i[index show edit update]
  
  get 'about_team', to: 'articles#about_team', as: :about_team
end
