class AddCartIdToOrderedItems < ActiveRecord::Migration
  def change
      add_column :ordered_items, :cart_id, :integer
  end
end
