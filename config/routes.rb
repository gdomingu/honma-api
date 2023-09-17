Rails.application.routes.draw do

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users, controllers: {sessions: 'users/sessions'}
  #for mobile
  namespace :api do
    resources :dialects, only: :index
    resources :grammars, only: :index
    resources :quiz_completions
  end
  #for admin
  resources :dialects
  resources :grammars
  resources :examples
  resources :quizzes
  resources :place_infos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
