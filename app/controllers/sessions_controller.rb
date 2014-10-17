class SessionsController < ApplicationController

  def new
    if session[:merchant_id]
      @merchant = Merchant.find(session[:merchant_id])
    else
      @merchant = Merchant.new
    end

    @categories = Category.all

    if session[:cart_id] == nil
      @ordered_items = []
      @cart_total = 0.0
    else
      @ordered_items = Cart.find(session[:cart_id]).ordered_items
      @cart_total = total_cart(session[:cart_id])
    end

    if params[:category]
      @products = Category.find(params[:category]).products.order(album_name: :asc)
    else
      @products = Product.all.order(album_name: :asc)
    end



    if params[:product_id]
      # still need to close cart and change status to paid etc. so far can only
      # add to the cart

      if session[:cart_id] == nil
        session[:cart_id] = Cart.create(status: "open").id
        @cart_total = 0.0
      end

      if OrderedItem.exists?(cart_id: session[:cart_id], product_id: params[:product_id])
        purchase = OrderedItem.find_by(cart_id: session[:cart_id], product_id: params[:product_id])
        purchase.quantity += 1
        purchase.save
      else
        OrderedItem.create(product_id: params[:product_id], quantity: 1,
            cart_id: session[:cart_id], status: "pending")
      end
      @ordered_items = Cart.find(session[:cart_id]).ordered_items
      @cart_total = total_cart(session[:cart_id])
      redirect_to root_path
    end



  end

  def create
    @merchant = Merchant.find_by(username: params[:merchant][:username], password: params[:merchant][:password])
    if @merchant == nil
      redirect_to root_path
    else
      session[:merchant_id] = @merchant.id
      redirect_to merchants_list_path
    end
  end

  def delete
    session[:merchant_id] = nil
    redirect_to root_path
  end

  def check_out
    redirect_to check_out
  end




end

def total_cart(cart_id)

  total = 0
  Cart.find(cart_id).ordered_items.each do |item|
    price = Product.find(item.product_id).price
    total = total + price * item.quantity
  end
  return total
end
