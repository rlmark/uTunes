class ProductsController < ApplicationController

  def index
    @products = Product.all.sort_by{|product| product.name}
  end

  def new

  end

  def create

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
