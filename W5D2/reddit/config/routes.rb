Rails.application.routes.draw do

  resources :users, only: [:create, :new, :show] do
    # resouces :subs, only: [:index]
  end

  resource :session, only: [:create, :new, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :subs, except: [:destroy] do
    resources :posts, only: [:index]
  end

  resources :posts, except: [:index] do
    resources :votes, only: [:create]
    resources :comments, only: [:create, :new]
  end

  resources :comments, only: [:show] do
    resources :comments, only: :create
    resources :votes, only: [:create]
  end

end
