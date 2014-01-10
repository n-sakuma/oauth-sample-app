HomesApiClient::Application.routes.draw do
  root to: 'welcome#index'

  get "welcome/index"
  get "setting" => 'setting#show', as: 'setting'
  get "setting/edit", as: 'edit_setting'
  patch "setting" => 'setting#update', as: 'update_setting'
  get '/app/auth/doorkeeper/callback', to: 'sessions#create'
  resource :sessions, only: %i(create destroy)
  resources :residents, only: %i(index)
end
