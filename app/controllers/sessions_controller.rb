class SessionsController < ApplicationController

  def new
    if session[:merchant_id]
      @merchant = Merchant.find(session[:merchant_id])
    else
      @merchant = Merchant.new
    end

    @categories = Category.all

    if params[:category]
      @products = Category.find(params[:category]).products.order(album_name: :asc)
    else
      @products = Product.order(album_name: :asc)
    end
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
    session[:merchant_id] = nil
    redirect_to root_path
  end

  def check_out
    redirect_to check_out
  end

end
