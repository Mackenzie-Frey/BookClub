Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resource :welcome, only: [:index]

  resources :books, only: [:new, :index, :show, :create] do
    resources :authors, only: [:new, :show], shallow: true do
    end
    resources :reviews, only: [:index], shallow: true do
    end
  end
  resources :users, only: [:show]
end
