class HomesController < ApplicationController
  def top
    @posts = Post.all.page(params[:page]).per(3)
  end

  def about
  end
end
