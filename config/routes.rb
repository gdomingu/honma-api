Rails.application.routes.draw do

  #for mobile
  namespace :api do
    resources :dialects, only: :index
  end
  #for admin
  resources :dialects
  resources :grammars
  resources :examples
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
