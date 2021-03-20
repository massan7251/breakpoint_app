Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only: [:new, :create, :show, :destroy] do
    resources :posts, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
  end
end
