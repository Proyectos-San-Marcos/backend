Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute'
  end

  resources :users
  resources :managements
  resources :areas
  resources :faculties
  resources :careers
  resources :projects

  get '/profile', to: 'users#current'
  post '/graphql', to: 'graphql#execute'

  match '*path', to: 'application#route_not_founded', via: %i[get post]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
