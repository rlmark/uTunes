class SessionsController < ApplicationController

  def new
    if session[:merchant_id]
      @merchant = Merchant.find(session[:merchant_id])
    else
      @merchant = Merchant.new
    end

    @categories = Category.all
    @ordered_items = []

    if params[:category]
      @products = Category.find(params[:category]).products.order(album_name: :asc)
    else
      @products = Product.all.order(album_name: :asc)
    end

    if params[:product_id]
      #check if purchase is in cart then add quantity
      # else create ordered item and add to cart
      # create_table "ordered_items", force: true do |t|
      #   t.integer  "quantity"
      #   t.integer  "product_id"
      #   t.datetime "created_at"
      #   t.datetime "updated_at"
      #   t.integer  "cart_id"
      # end

      if session[:cart_id] == nil
        session[:cart_id] = Cart.create(status: "open").id
      end
      if OrderedItem.exists?(cart_id: session[:cart_id], product_id: params[:product_id])
        purchase = OrderedItem.find_by(cart_id: session[:cart_id], product_id: params[:product_id])
        purchase.quantity += 1
        purchase.save
      else
        OrderedItem.create(product_id: params[:product_id], quantity: 1,
            cart_id: session[:cart_id], status: "pending")
      end
      @ordered_items = Cart.find(session[:cart_id]).ordered_items

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




end
