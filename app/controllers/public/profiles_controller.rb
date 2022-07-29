class Public::ProfilesController < ApplicationController
  before_action :authenticate_user!

def show
  @profile = current_user.profile
  @user = current_user
  @posts = @user.posts
end

def edit
  @profile = current_user.profile_prepare
end

# いいね一覧表示（ユーザーと投稿）
def favorites
 @favorite_posts = current_user.favorite_posts
 @favorite_users = Post.joins(:favorites).where("posts.user_id <> ? and favorites.user_id <> ? ", current_user.id, current_user.id).map {|favorite| favorite.user}.flatten.uniq
end

def create
end


def update
  @profile = current_user.profile_prepare
  # 特定の物だけを変更（名前、性別、写真など）↓assign_attributes
  @profile.assign_attributes(profile_params)
  if @profile.save
    redirect_to public_profile_path, notice: 'プロフィール更新！'
  else
  flash.now[:error] = '更新できませんでした'
  render :edit
  end
end

private
def profile_params
  params.require(:profile).permit(:name, :gender, :image, :subbody ,:mainbody)
end
end
