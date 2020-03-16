Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root "ideas#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ideas, only: [:index, :new, :create, :destroy, :show]
  resources :users, only: [:index, :show]
end
