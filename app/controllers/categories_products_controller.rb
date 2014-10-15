class CategoriesProductsController < ApplicationController

  def index
    @categories=Category.all # can use associations to reach the products
  end


  def new
  end

end
