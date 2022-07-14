class HomesController < ApplicationController
  def top
    @posts = Post.all.page(params[:page])
  end

  def about
  end
end
