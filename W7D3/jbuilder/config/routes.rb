Rails.application.routes.draw do
  # Your routes here!
  namespace :api, defaults: { format: :json } do
    resources :gifts, only: [:show]
    resources :guests, only: [:index, :show] do
      resources :gifts, only: [:index]
    end
    resources :parties, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
