Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # 目標関係のルーティング
  namespace :user do
    resources :objectives do
      resources :comments, only:[:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end


  # ユーザー関係のルーティング
  namespace :user do
    resources :users, only:[:index, :show, :edit, :update] do 
      member do
        get :following, :followers
      end
    end
  end
  

  # フォロー関係のルーティング
  resources :relationships, only: [:create, :destroy]
  get 'relationships/index_followings'

  

end
