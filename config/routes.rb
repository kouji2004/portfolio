Rails.application.routes.draw do


  #管理者用
    devise_for :admins, controllers: {
      sessions: "admins/sessions"
    }

    # ユーザー用
    devise_for :users, controllers: {
      registrations: "users/registrations",
      sessions: 'users/sessions'
    }

root to: "homes#top"

   namespace :admins do
      resources :categories,except: [:new]
      # 管理者でのユーザー退会機能
      resources :users, only: [:index, :edit, :update]

  end


   namespace :public, only:[:new, :index, :show, :edit, :create, :destroy] do
    # 退会機能
      resource :users, only:[:show] do
      patch "withdrawal" => "users#withdrawal"
       member do
      get "favorites"
      end
    end
     resources :posts do
       collection do
            get "log" => "posts#log"
       end
          resource :favorites, only: [:create, :destroy]
          resources :comments, only:[:create, :destroy]
      end


       resource :profile, only:[:index,:show, :edit, :update, :create] do
           member do
             get :favorites
           end
       end
      end

# ゲストログイン機能
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  get "search" => "searches#search"


# # 退会機能
#   namespace :users do
#     get 'accounts/:id/unsubscribe' => 'accounts#unsubscribe', as: 'unsubscribe'
#     patch 'accounts/:id/withdrawal' => 'accounts#update', as: 'withdrawal'
#   end


end
