Rails.application.routes.draw do
  resources :products

  get 'users/index'
  devise_for :users
  resources :users
  resources :clients

  post 'users/update_roles', to: 'users#update_roles', as: 'update_roles'

  patch 'export', to: 'products#export_csv', as: 'export_products'

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :invoices, only: [:show]
end
