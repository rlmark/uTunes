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


end
