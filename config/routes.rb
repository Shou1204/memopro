Rails.application.routes.draw do
  devise_for :users
  root to: "memos#index"
  resources :memos do
    resources :comments, only:[:create, :update, :destroy]
  end
  resources :users, only:[:show]
  resources :favorites, only:[:create, :destroy]
end