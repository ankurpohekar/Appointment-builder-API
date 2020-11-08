Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      namespace :account do
        post '/signin', to: "session#create"
        post '/signup', to: "registration#create"
      end
      resources :slots, only: [:index]
      resources :appointments
      resources :doctors, only: [:index]
    end
  end
end
