Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resource :welcome, only: [:index]

  resources :books, only: [:new, :index, :show, :create, :destroy] do
    resources :reviews, shallow: true, only: [:new, :create, :destroy]
  end
  resources :users, only: [:show]
  resources :authors, only: [:new, :show]
end
