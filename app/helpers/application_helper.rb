module ApplicationHelper
  # create a sessions helper.
  def show_cart
    cart = Cart.find(session[:cart_id])
    cart.ordered_items.length
  end

end
