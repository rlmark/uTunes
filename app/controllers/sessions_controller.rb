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
    @merchant = Merchant.find_by(username: params[:merchant][:username])#password: params[:merchant][:password])
    if @merchant == nil
      redirect_to "/sessions/signin"
    elsif BCrypt::Password.new(@merchant.password) == params[:merchant][:password] #fails here?
      session[:merchant_id] = @merchant.id
      redirect_to dashboard_path
    else 
      redirect_to "/sessions/signin"
    end
  end

  def delete
    session[:merchant_id] = nil
    redirect_to root_path
  end

  def check_out
    redirect_to check_out
  end

  def signin
  end

end
