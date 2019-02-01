Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: "sessions#create" 
      resources :users
      resources :images
      resources :slideshows do
        resources :slides, shallow: true
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
