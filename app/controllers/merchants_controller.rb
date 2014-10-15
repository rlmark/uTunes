class MerchantsController < ApplicationController

  def index
    @all_merchants = Merchant.all
    @all_products = Product.all
  end


  def create

  end




  def total_revenue

  end





end
