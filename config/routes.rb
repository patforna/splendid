Splendid::Application.routes.draw do
  resources :message, :only => [:new, :create]
end
