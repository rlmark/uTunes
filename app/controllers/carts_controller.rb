class CartsController < ApplicationController

  def index
  end

  def checkout

  # fetch user information
  end

  def order
  # place order
  end

  def empty_cart
    session[:cart_id] = nil
    redirect_to root_path
  end

end

private

def total_cart(cart_id)
  total = 0
  Cart.find(cart_id).ordered_items.each do |item|
    price = Product.find(item.product_id).price
    total = total + price * item.quantity
  end
  return total
end
