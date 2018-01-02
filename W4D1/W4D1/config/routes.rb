Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :comments, only: [:index]
  end

  resources :artists, only: [] do
    resources :artworks, only: [:index]
  end

  resources :viewers, only: [] do
    resources :artworks, only: [:index]
  end

  resources :artworks, only: [:create, :destroy, :show, :update, :index] do
    resources :comments, only: [:index]
  end

  resources :artworksshares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy, :update, :show, :index]


  # resources :users do
  #   resources :comments, only: [:index]
  # end

  # resources :artworks do
  #   resources :comments, only: [:index]
  # end

  # get 'users', to: 'users#index', as: 'users'
  # get 'users/:id', to: 'users#show', as: 'user'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # post 'users', to: 'users#create'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # put 'users/:id', to: 'users#update'
  # patch 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

end
