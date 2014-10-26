module ApplicationHelper
  # create a sessions helper.
  def show_cart
    if session[:cart_id] != nil
      cart  = OrderedItem.where(cart_id: session[:cart_id], status: "pending")
      cart.collect{|i| i.quantity }.sum
    else
      "0"
    end
  end

end
