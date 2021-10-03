Rails.application.routes.draw do
 
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :books
  resources :users,only:[:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
  get :followers, on: :member
  get :followeds, on: :member
  end
end
