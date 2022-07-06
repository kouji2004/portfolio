class Public::CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    unless @comment.save
      render 'error'
    end
      redirect_to request.referer
  end


  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
    comment.destroy
    redirect_to request.referer
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
