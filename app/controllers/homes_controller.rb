class HomesController < ApplicationController
  def top
    @posts = Post.all.page(params[:page]).per(3)
    @categories = Category.all

    # 投稿したユーザーが重複したら削除する
    user_ids = Post.pluck(:user_id).uniq
    @users = User.where(id: user_ids)
  end

# ((a),(b)(b)).pluck → (a,b,b).uniq→(a,b)

  def about
  end
end
