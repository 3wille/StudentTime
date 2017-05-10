Rails.application.routes.draw do
  root to: "landing_page#index"

  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  get "/auth/failure", to: "sessions#failure"
  delete "sessions" => "sessions#destroy"

  get "/dashboard", to: "dashboard#index"
  resources :time_entries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
