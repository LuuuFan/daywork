Rails.application.routes.draw do
  resources :goals, only: [:new, :create, :show, :destroy] do
    member do
      post :complete
      post :uncomplete
    end
    resources :comments, only: [:create, :index]
    resources :cheers, only: [:create]
  end
  resources :users, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create, :index]
    resources :goals, only: [:index]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :cheers, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
