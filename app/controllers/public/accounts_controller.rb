class Public::AccountsController < ApplicationController
  def show
     @user = User.find(params[:id])
      if @user == current_user
        redirect_to public_profile_path
      end
    @posts = @user.posts
  end

end
