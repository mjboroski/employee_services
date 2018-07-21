Rails.application.routes.draw do
  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  post "/selections/new", to: "selections#new"
  delete "/selections", to: "selections#destroy"
  delete "/benefits", to: "benefits#destroy"
  get '/auth/github/callback', to: 'sessions#create'

  resources :benefits
  resources :selections
  resources :users do
    resources :benefits, only: [:index, :show] do
      resources :selections, only: [:show]
    end
    resources :selections, only: [:show]
  end

end
