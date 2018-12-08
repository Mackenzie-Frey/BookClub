Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resource :welcome, only: [:index]

  resources :books, only: [:index, :show] do
    resources :reviews, only: [:index] do
    end
  end
  resources :users, only: [:show] do
    resources :reviews, only: [:index] do
    end
  end

end
