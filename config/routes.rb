Rails.application.routes.draw do

  get 'users/new' => 'users#new', as: :sign_up
  post 'users' => 'users#create', as: :users
  
  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_out' => 'sessions#delete', as: :sign_out

end
