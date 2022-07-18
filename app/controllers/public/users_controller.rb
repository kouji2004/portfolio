class Public::UsersController < ApplicationController
before_action :set_user

# プロフィールページ
def show
end


def withdrawal
  @user.update(is_delete: true)
  reset_session
  flash[:notice] = "退会処理を実行しました"
  redirect_to root_path
end

  private
  def user_params
    params.require(:user).permit(:name,:email,:is_delete)
  end

  def set_user
      @user = current_user
  end
end