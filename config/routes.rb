Codearena::Application.routes.draw do
  resource :challenge, :only => [:update]
  resources :entries, :only => [:create]

  root :to => 'home#index'
end
