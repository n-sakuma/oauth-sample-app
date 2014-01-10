HomesApi::Application.routes.draw do
  use_doorkeeper

  resources :apps, only: %i[new create], controller: :external_applications
  resources :sessions, only: %i[new create destroy]

  root to: 'external_applications#new'

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1 do
      resources :residents, only: %i(index show)
      get 'app', to: 'external_applications#show'
    end
  end
end
