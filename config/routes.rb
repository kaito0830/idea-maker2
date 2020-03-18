Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
  resources :ideas, only: [:index, :new, :create, :destroy, :show] do
    resources :likes, only: [:create, :destroy]
  end
  root "ideas#index"
end
