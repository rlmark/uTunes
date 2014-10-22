class CartsController < ApplicationController

  def index
  end

  # Check out page displays cart, requests user payment information
  def check_out
    @cart = Cart.find(session[:cart_id])
    @ordered_items = @cart.ordered_items
    @cart_total = total_cart(@ordered_items)
  end

  # Function shows total ordered-items
  def show
    if session[:cart_id] == nil
      @ordered_items = []
      @cart_total = 0.0
    else
      @ordered_items = Cart.find(session[:cart_id]).ordered_items
      @cart_total = total_cart(@ordered_items)
    end
  end

  # Collect and record all customer information
  def customer_information
    cart = Cart.find(session[:cart_id])
    cart.name = params[:cart][:name]
    cart.email = params[:cart][:email]
    cart.address = params[:cart][:address]
    cart.city = params[:cart][:city]
    cart.state = params[:cart][:state]
    cart.zip = params[:cart][:zip].to_i
    cart.credit_num = params[:cart][:credit_num].to_i
    cart.credit_cvv = params[:cart][:credit_cvv].to_i
    cart.credit_exp = params[:cart][:credit_exp]

    cart.save
    redirect_to confirm_customer_information_path

  end

  # Display all information before submitting order
  def confirmation
    @cart = Cart.find(session[:cart_id])
  end

  # Putting items in cart
  def add_item

    if params[:product_id]
      # still need to close cart and change status to paid etc. so far can only
      # add to the cart

      if session[:cart_id] == nil
        session[:cart_id] = Cart.create(status: "open").id
        @cart_total = 0.0
      end

      ordered_item = OrderedItem.find_by(cart_id: session[:cart_id], product_id: params[:product_id], status: "pending")

      if ordered_item != nil
        ordered_item.quantity += 1
        ordered_item.save
      else
        OrderedItem.create(product_id: params[:product_id], quantity: 1,
            cart_id: session[:cart_id], status: "pending")
      end
      @ordered_items = Cart.find(session[:cart_id]).ordered_items
      @cart_total = total_cart(session[:cart_id])
      redirect_to root_path
    end
  end

  def empty_cart
    session[:cart_id] = nil
    redirect_to root_path
  end

end

private

def total_cart(items)
  total = 0
  items.each do |item|
    if item.status == "pending"
    price = Product.find(item.product_id).price
    total = total + price * item.quantity
    end
  end
  return total
end

def check_stock(ordered_item)
  ordered_item.quantity > Product.find(ordered_item.product_id).quantity


end

# def total_cart(cart_id)
#   if session[:cart_id] != nil
#     total = 0
#     Cart.find(cart_id).ordered_items.each do |item|
#       price = Product.find(item.product_id).price
#       total = total + price * item.quantity
#     end
#     return total
#   else
#     return "empty cart"
#   end
# end
