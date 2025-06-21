Rails.application.routes.draw do
  devise_for :users

  get '/guests', to: redirect('/guests.html')
  root 'welcome#index'

  get 'about_team', to: 'articles#about_team', as: :about_team
end
