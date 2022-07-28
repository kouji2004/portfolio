class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  # レイアウトメソッド
   layout 'dashboard/dashboard'

      # 管理者でのユーザー退会機能

def index
@users = User.all
end

def edit
@user = User.find(params[:id])
end

def update
 @user = User.find(params[:id])
  if @user.update(user_params)
   redirect_to admins_users_path
  else
   render :edit
  end
end

private
def user_params
  params.require(:user).permit(User.attribute_names)
end

end
