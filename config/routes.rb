Rails.application.routes.draw do

  resources :comments

  resources :professor_evaluations

  resources :course_evaluations

  resources :professors

  resources :courses

  resources :schools

  resources :universities

  root 'pages#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :sessions => "users/sessions", :registrations => "users/registrations"}
end
