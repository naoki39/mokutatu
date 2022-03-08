Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:"communities#index"
  resources :communities, only: :index do
    resources :posts, only: [:index, :new, :create] 
  end
  resources :users, only: :show
  
end
