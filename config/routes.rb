Rails.application.routes.draw do
  root "welcome#index"
  get '/search', to: 'search#index'
  get '/api/v1/games/:id', to: 'api/v1/games#show'
  post '/api/v1/games/:id/plays', to: 'api/v1/plays#create'
end
