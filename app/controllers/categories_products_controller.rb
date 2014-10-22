class CategoriesProductsController < ApplicationController

  def index
    @categories=Category.all # can use associations to reach the products
  end


  def new 
    @product = Product.find(params[:id])
    @categories = Category.all.to_a # need to make an array so you can do stuff below
    @categories = @categories.delete_if{|obj| @product.categories.include?(obj)}
  end

  def create
    @categories_products = Categories_product.where(product_id: params[:id])
    @categories_product = Categories_product.new(params.require(:categories_product).permit(:name, :product_id))
    if @categories_product.save
      redirect_to add_category_path(@categories_product.product_id)
    else
      render :new
    end
  end

  def update
    @categories_products = Categories_product.all
      
  end

end
