Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "homes#top"
  get "home/about" => "homes#about"
  get "/users/:id/following" => "users#following", as: 'user_followings'
  get "/users/:id/followers" => "users#follower", as: 'user_followers'

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resources :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]do
    resources :relationships, only: [:create, :destroy]
  end
end
