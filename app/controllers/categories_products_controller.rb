class CategoriesProductsController < ApplicationController

  def index
    @categories_products=CategoriesProducts.all
    @products=Product.all
    @categories=Category.all
  end


  def new
  end

end
