Codearena::Application.routes.draw do
  resource :challenge, :only => [:show, :update]
  resources :entries, :only => [:create, :index]

  get '/auth/github/callback' => 'sessions#create'
  get '/auth/logout' => 'sessions#destroy'

  root :to => 'home#index'
end
