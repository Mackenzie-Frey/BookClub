Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resource :welcome, only: [:index]

  resources :books, only: [:new, :index, :show, :create] do
    resources :authors, only: [:new] do
    resources :reviews, only: [:index] do
    end
  end
  resources :reviews, only: [:index] do
  end
  end
  resources :users, only: [:show] do
  end
end
