Codearena::Application.routes.draw do
  resource :challenge, :only => [:show, :update]
  resources :entries, :only => [:create, :index]

  match '/auth/github/callback', to: 'sessions#create'

  root :to => 'home#index'
end
