Rails.application.routes.draw do
  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  post "/selections/new", to: "selections#new"
  delete "/selections", to: "selections#destroy"
  delete "/benefits", to: "benefits#destroy"
  get '/auth/github/callback', to: 'sessions#create'
  get "/users/:id/get_json", to: "users#get_json"
  get "/benefits/get_json", to: "benefits#get_json"
  get "/benefits/:id/get_json_show", to: "benefits#get_json_show"
  get "users/:id/benefits/:id/get_json_show", to: "benefits#get_json_show"

  resources :benefits
  resources :selections
  resources :users do
    resources :benefits, only: [:index, :show] do
      resources :selections, only: [:show]
    end
    resources :selections, only: [:show]
  end

end
