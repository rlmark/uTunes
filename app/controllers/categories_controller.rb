class CategoriesController < ApplicationController

  def index
  end

  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))
    if @category.save
      redirect_to new_categories_path
    else
      @categories = Category.all
      render :new
    end
  end

end
