Rails.application.routes.draw do
  root to: "landing_page#index"

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :time_entries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
