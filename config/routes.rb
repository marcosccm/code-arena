Codearena::Application.routes.draw do
  resource :challenge, :only => [:show, :update]
  resources :entries, :only => [:create, :index]

  root :to => 'home#index'
end
