class MerchantsController < ApplicationController

  def index
    @all_merchants = Merchant.all
    @all_products = Product.where(merchant_id: :id)
  end


  def create

  end




  def total_revenue

  end





end
