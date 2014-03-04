Ex1::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, :only=>[:create]
    end
  end

  root :to => "home#index"
end
