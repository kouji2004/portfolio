class Public::AccountsController < ApplicationController
    before_action :authenticate_admin!, except:[:index,:new,:show]
  def show
     @user = User.find(params[:id])
      if @user == current_user
        redirect_to public_profile_path
      end
    @posts = @user.posts
  end

end
