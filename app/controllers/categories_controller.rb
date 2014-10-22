class CategoriesController < ApplicationController

  def index
  end

  def new
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))
    if @category.save
      redirect_to new_categories_path
    else 
      render new_categories_path
    end
  end

end
