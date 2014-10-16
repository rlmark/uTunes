class MerchantsController < ApplicationController

  def index
    @all_merchants = Merchant.all
  end

  def new

  end


  def create

    @merchant = Merchant.new(params.require(:merchant).permit(:name, :email, :username, :password))
    if @merchant.save
      redirect_to root_path
    else
      render merchants_list_path  #this renders new.html.erb again
    end
  end


  def total_revenue

  end

  def dashboard
    #raise session[:merchant_id].inspect
    @merchant_dash = Merchant.find(session[:merchant_id])
    params[:thing] ||= :id
    params[:direction] ||= :asc
    @products = @merchant_dash.products.order(params[:thing].to_sym => params[:direction].to_sym)
  end



end
