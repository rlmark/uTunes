module ApplicationHelper
  # create a sessions helper.
  def show_cart
    if session[:cart_id] != nil
      cart = Cart.find(session[:cart_id])
      cart.ordered_items.collect{|i| i.quantity }.sum
    else
      "0"
    end
  end

end
