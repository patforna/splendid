Splendid::Application.routes.draw do
  resources :users, :only => [:new, :create]
  resources :messages, :only => [:new, :create]
end
