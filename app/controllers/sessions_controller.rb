class SessionsController < ApplicationController

  def new

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
    reset session
    redirect_to root_path
  end

  # def create
  #   @vendor = Vendor.find_by username: params[:vendor][:username], password: params[:vendor][:password]
  #   if @vendor == nil
  #     redirect_to root_path
  #   else
  #     session[:vendor_id] = @vendor.id
  #     redirect_to "/vendors/profile"
  #   end
  # end

  # def delete
  #   session[:vendor_id] = nil
  #   redirect_to root_path
  # end


end
