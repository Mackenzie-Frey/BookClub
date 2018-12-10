Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :books, only: [:new, :index, :show, :create] do
    resources :authors, only: [:new, :show], shallow: true do
      resources :reviews, only: [:index]
    end
    resources :users, only: [:show]
  end

  resources :reviews, only: [:index]
end
