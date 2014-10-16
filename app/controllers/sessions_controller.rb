class SessionsController < ApplicationController

  def new
    @categories = Category.all
    if params[:category]

      @products = Category.find(params[:category]).products.order(album_name: :asc)
    else
      @products = Product.all.order(album_name: :asc)
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
    reset_session
    redirect_to root_path
  end




end
