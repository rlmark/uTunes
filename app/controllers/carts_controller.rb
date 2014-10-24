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
      @cart = Cart.find(session[:cart_id])
      @ordered_items = Cart.find(session[:cart_id]).ordered_items
      @cart_total = total_cart(@ordered_items)
    end
  end

  # Collect and record all customer information
  def cart


    @cart = Cart.find(session[:cart_id])
    @cart.status = "closed"
    @cart.name = params[:cart][:name]
    @cart.email = params[:cart][:email]
    @cart.address = params[:cart][:address]
    @cart.city = params[:cart][:city]
    @cart.state = params[:cart][:state]
    @cart.zip = params[:cart][:zip].to_i
    cc_number = params[:cart][:credit_num]
    @cart.credit_num = /\d{4}\Z/.match(cc_number)[0]

    @cart.credit_cvv = params[:cart][:credit_cvv]
    @cart.month = params[:cart][:month]
    @cart.year = params[:cart][:year]
    if @cart.save
      redirect_to confirmation_path
    else
      @cart.status = "open"
      @ordered_items = OrderedItem.where(cart_id: session[:cart_id], status: "pending")
      @cart_total = total_cart(@ordered_items)
      render "check_out"

    end
  end

  # Display all information before submitting order
  def confirmation
    @cart = Cart.find(session[:cart_id])
    @ordered_items = OrderedItem.where(cart_id: session[:cart_id], status: "pending")
    @cart_total = total_cart(@ordered_items)
  end

  # Customer has paid so items are marked paid and session[:cart_id] = nil
  def complete_order
    @cart = Cart.find(session[:cart_id])
    @ordered_items = OrderedItem.where(cart_id: session[:cart_id], status: "pending")
    @ordered_items.each do |item|
      item.status = "paid"
      item.save
      product = Product.find(item.product_id)
      product.stock = product.stock - item.quantity
      product.save
    end
    @cart.status = "closed"
    @cart.save
    session[:cart_id] = nil
    redirect_to final_page_path

  end

  # Putting items in cart
  def add_item
    if params[:product_id] != nil
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
      @cart_total = total_cart(@ordered_items)
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

# def check_stock(ordered_item)
#   ordered_item.quantity > Product.find(ordered_item.product_id).quantity
#
#
# end

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
