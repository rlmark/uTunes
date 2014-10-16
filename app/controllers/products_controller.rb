class ProductsController < ApplicationController

  def index
    @products = Product.all.sort_by{|product| product.album_name}
  end

  def show
    @categories = Category.all
    @product = Product.find(params[:id])
  end

  def new

  end

  def create

  end
  
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(params.require(:product).permit(:artist, :album_name, :image, :stock, :price))
    redirect_to dashboard_path
    else
    render :edit_product
    end
  end

  def check_stock

  end

  def move_to_cart

  end

  # Reture might be useful for temporary retirement
  def retire

  end

  # Delete is for no longer selling the product
  def delete

  end

end
