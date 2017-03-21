Rails.application.routes.draw do

  get 'home/index'

  get 'home/home'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'}
  resources :accounts

  root 'home#index'


end
