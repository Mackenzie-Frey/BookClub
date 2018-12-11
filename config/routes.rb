Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :books, only: [:new, :index, :show, :create] do
    resources :reviews, shallow: true, only: [:new, :create]
  end
  resources :users, only: [:show]
  resources :authors, only: [:new, :show]
end
