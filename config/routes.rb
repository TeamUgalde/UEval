Rails.application.routes.draw do

  root 'pages#home'

  resources :universities, only: :index, shallow: true do
    resources :schools, only: :index do
      resources :courses do
        resources :course_evaluations
        resources :comments
      end
      resources :professors do
        resources :professor_evaluations
        resources :comments
      end
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :sessions => "users/sessions", :registrations => "users/registrations"}
end
