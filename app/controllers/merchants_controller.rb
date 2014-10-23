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
    if params[:holder] == params[:merchant][:password]
      @merchant.password = BCrypt::Password.create(params[:merchant][:password])
      if @merchant.save
        redirect_to "/sessions/signin"
      end
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
      @merchant.password = BCrypt::Password.create(params[:merchant][:password]) #not working
      @merchant.save
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
    ordered_items = @cart.ordered_items.collect{|i| i.product}
    @merchant_items = ordered_items.select{|i| i.merchant_id == session[:merchant_id]}

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
