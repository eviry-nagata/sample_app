
Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  # ログイン機能に必要なルーティング
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # フォロー機能に必要なルーティング
  resources :users do
    member do
      get :following, :followers
    end
  end
# アカウント有効化のためのルーティング
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  # マイクロポストのルーティング 
  resources :microposts,          only: [:create, :destroy]
# これは、フォロー/アンフォローのためのルーティング
  resources :relationships,       only: [:create, :destroy]
end
