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

   namespace :public, only:[:new, :index, :show, :edit ,:create, :destroy] do
     resources :posts do
          resource :favorites, only: [:create, :destroy]
          resources :comments, only:[:create, :destroy]
      end

       resource :profile, only:[:index,:show, :edit, :update] do
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

end
