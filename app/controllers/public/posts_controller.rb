class Public::PostsController < ApplicationController

  def index
    # 検索タグ
    if params[:category].present?
      @category = Category.request_category(params[:category])
      @posts = Post.on_category(@category)
    else
      @posts = Post.all
    end
    @categories = Category.all
  end

  def edit
    # 検索タグ
    @categories = Category.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @posts = Post.all
    @user = @post.user
    @profile = current_user.profile
  end

  def new
    @post = Post.new
    # 検索タグ
    @categories = Category.all
  end

  def log
    @post = Post.new
  end

 def create
   @post = Post.new(post_params)
   @post.user_id = current_user.id
   if @post.save
      redirect_to public_posts_path
   else
     render :new
   end
 end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_posts_path
  end

 private

 def post_params
   params.require(:post).permit(:title, :body, :illust, :prevention,:category_id, :images, images: [])
 end

end