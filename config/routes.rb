Rails.application.routes.draw do

  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :books
  resources :users,only:[:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
end
