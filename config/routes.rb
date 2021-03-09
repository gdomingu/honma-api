Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: 'users/sessions'}
  #for mobile
  namespace :api do
    resources :dialects, only: :index
  end
  #for admin
  resources :dialects
  resources :grammars
  resources :examples
  resources :quizzes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
