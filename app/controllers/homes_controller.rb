class HomesController < ApplicationController
  def top
    @posts = Post.all.page(params[:page]).per(3)
    @categories = Category.all
  end

  def about
  end
end
