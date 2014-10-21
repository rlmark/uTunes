class OrderedItemsController < ApplicationController

  def index

  end


  def put_in_cart(cart_id)

  end

  def update_quantity
    quantity = params[:ordered_item][:quantity].to_i
    record = OrderedItem.find(params[:ordered_item][:item_id])
    if record != nil && quantity >= 0
      record.quantity = quantity
      record.save
    end
    redirect_to show_cart_path

  end


  def delete_ordered_item
    item_id = params[:id]
    record = OrderedItem.find(item_id)
    record.status = "cancelled"
    record.save
    redirect_to show_cart_path
  end

end
