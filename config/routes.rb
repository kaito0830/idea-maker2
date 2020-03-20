Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update]
  resources :ideas, only: [:index, :new, :create, :destroy, :show] do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
    resources :comments, only: :create
  end
  root "ideas#index"
end