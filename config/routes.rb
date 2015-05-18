Rails.application.routes.draw do

  root 'pages#home'

  get '/profile', to: 'pages#profile'

  get '/professors/pending', to: 'professors#index_pending'

  get '/courses/pending', to: 'courses#index_pending'
  
  get '/schools/:school_id/index_courses_professors', to: 'schools#index_courses_professors', as: 'school_courses_professors'

  resources :universities, only: :index, shallow: true do
    resources :schools, only: :index do
      resources :courses do
        resources :course_evaluations, only: [:new, :create]
        resources :comments, only: [:index, :new, :create, :destroy]
      end
      resources :professors do
        resources :professor_evaluations
        resources :comments, only: [:index, :new, :create, :destroy]
      end
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :sessions => "users/sessions", :registrations => "users/registrations"}

  resources :notifications, only: [:index, :new, :create]

end
