Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'dashboard#index'
  get 'dashboard/details' => 'dashboard#show', as: :details

  get 'recipes/show/:id' => 'recipes#show', as: :recipes_show
  get 'recipes/search' => 'recipes#search', as: :recipe_search
  get 'recipes/new' => 'recipes#new', as: :add_recipe
  post 'recipes/' => 'recipes#create', as: :recipes

  get 'users/new' => 'users#new', as: :sign_up
  post 'users' => 'users#create', as: :users
  get 'users/:id' => 'users#info', as: :account_info

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_out' => 'sessions#delete', as: :sign_out

end
