class ProductsController < ApplicationController

  def index
    @products = Product.all.sort_by{|product| product.album_name}
  end

  def show
    @categories = Category.all
    @product = Product.find(params[:id])
    @ratings = @product.ratings
  end

  def new
    @product = Product.new
  end

  # Creates a new product in the database
  def create
    merchant = Merchant.find(session[:merchant_id])

    @product = merchant.products.new(params.require(:product).permit(:artist, :album_name, :description, :image, :stock, :active))

    thing = /(\d+)\.?(\d{2})?/.match(params[:holder])
    @product.price = (thing[1].to_i * 100) + thing[2].to_i
    if @product.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(params.require(:product).permit(:artist, :album_name, :description,:image, :active, :stock, :price))
    redirect_to dashboard_path
    else
    render :edit_product
    end
  end

  def check_stock

  end

  def move_to_cart

  end

  # Retire might be useful for temporary retirement
  def retire

  end

  # Delete is for no longer selling the product
  def delete
    Product.destroy(params[:id])
    redirect_to dashboard_path
  end

end
