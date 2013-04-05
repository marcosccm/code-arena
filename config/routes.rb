Codearena::Application.routes.draw do
  resource :challenge, :only => [:show, :update]
  resources :entries, :only => [:create, :index]

  match '/auth/github/callback', to: 'sessions#create'
  match '/auth/logout', to: 'sessions#destroy'

  root :to => 'home#index'
end
