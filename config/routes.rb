Rails.application.routes.draw do

  get 'home/index'
  get 'home/home'

  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'}
  resources :accounts
  resources :categories
  resources :transactions

  root 'accounts#index'


end
