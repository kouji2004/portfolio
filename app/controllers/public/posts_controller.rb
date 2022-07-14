class Public::PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @posts = Post.all
    @user = @post.user
  end

  def new
    @post = Post.new
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
   params.require(:post).permit(:title, :body, :illust, :prevention, images: [])
 end

end