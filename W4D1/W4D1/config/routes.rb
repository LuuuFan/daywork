Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :destroy, :index, :show, :update]

  resources :artists do
    resources :artworks, only: [:index]
  end

  resources :viewers do
    resources :artworks, only: [:index]
  end

  resources :artworks, only: [:create, :destroy, :show, :update]

  resources :artworksshares, only: [:create, :destroy]

  # get 'users', to: 'users#index', as: 'users'
  # get 'users/:id', to: 'users#show', as: 'user'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # post 'users', to: 'users#create'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # put 'users/:id', to: 'users#update'
  # patch 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

end
