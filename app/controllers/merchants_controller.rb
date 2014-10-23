class MerchantsController < ApplicationController

  def index
    @all_merchants = Merchant.all
  end

  def new
    @merchant = Merchant.new
  end

  def create
    @all_merchants = Merchant.all
    @merchant = Merchant.new(params.require(:merchant).permit(:name, :email, :username, :password))
    if @merchant.save
      redirect_to root_path
    else
      render new_merchant_path
    end
  end

  def edit
    @merchant = Merchant.find(session[:merchant_id])
  end

  def update
    @merchant = Merchant.find(session[:merchant_id])
    if @merchant.update(params.require(:merchant).permit(:name, :email, :username, :password))
      redirect_to dashboard_path
    else
      render :edit_merchant
    end
  end

  def dashboard
    #raise session[:merchant_id].inspect
    @merchant_dash = Merchant.find(session[:merchant_id])
    params[:thing] ||= :id
    params[:direction] ||= :asc
    @products = @merchant_dash.products.order(params[:thing].to_sym => params[:direction].to_sym)

  end

  def orders
    merchant = Merchant.find(session[:merchant_id])
    if params[:status] != nil
      @ordered_items = merchant.ordered_items.where(status: params[:status])
    else
      @ordered_items = merchant.ordered_items
    end
    @revenue = total_revenue(@ordered_items)
  end

  def ship
    @cart = Cart.find(params[:id])
    ordered_products = @cart.ordered_items.collect{|i| i.product}
    @merchant_items = ordered_products.select{|i| i.merchant_id == session[:merchant_id]}
  end

  def change_status
    # gets cart object using params id
    cart = Cart.find(params[:id])
    #
    # # queues up all ordered items and then returns their associated product object.
    # all_products = cart.ordered_items.collect{|i| i.product }
    #
    # # returns all merchant's product instances
    # # need to ad && i.ordered_items.cart id == params[:id] because this
    # merchant_products = all_products.select{|i| i.merchant_id == session[:merchant_id]}
    #
    # # nested loop takes all merchants product instances, gets their ordered items(an array), then iterates throught hat array chanign the status of the individual ordered item to shipped.
    # merchant_products.each{|i| i.ordered_items.each{|ord_i| ord_i.status = "shipped"; ord_i.save}}

    orders = cart.ordered_items.includes(:product).where(products: {merchant_id: session[:merchant_id]})

    orders.update_all(status: "shipped")

    redirect_to dashboard_path
  end

private
  def total_revenue(items)
    total = 0
    items.each do |item|
      price = item.product.price
      total = total + price * item.quantity
    end
    total
  end

end
