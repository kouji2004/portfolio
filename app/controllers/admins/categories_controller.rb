class Admins::CategoriesController < ApplicationController
before_action :authenticate_admin!
  # レイアウトメソッド
   layout 'dashboard/dashboard'

# レイアウトメソッド
 layout 'dashboard/dashboard'


def index
    @categories = Category.all
    @category = Category.new
    @posts = Post.all.page(params[:page]).per(3)
end

def edit
  @category = Category.find(params[:id])
end


  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    @category.save
    redirect_to admins_categories_path
  end



def create
    category = Category.new(category_params)
    category.save
    redirect_to admins_categories_path
end


def destroy
  @category = Category.find(params[:id])
    @category.destroy
    redirect_to admins_categories_path
end

private
    def category_params
      params.require(:category).permit(:name)
    end


end
