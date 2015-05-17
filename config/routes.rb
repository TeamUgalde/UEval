Rails.application.routes.draw do

  root 'pages#home'

  get '/profile', to: 'pages#profile'

  get '/professors/pending', to: 'professors#index_pending'

  get '/courses/pending', to: 'courses#index_pending'

  resources :universities, only: :index, shallow: true do
    resources :schools, only: :index do
      resources :courses, except: [:destroy, :edit, :update] do
        resources :course_evaluations
        resources :comments, only: [:index, :new, :create, :destroy]
      end
      resources :professors, except: [:destroy] do
        resources :professor_evaluations
        resources :comments, only: [:index, :new, :create, :destroy]
      end
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :sessions => "users/sessions", :registrations => "users/registrations"}

  resources :notifications, only: [:index, :new, :create]

end
