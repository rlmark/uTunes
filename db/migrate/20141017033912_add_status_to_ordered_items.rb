class AddStatusToOrderedItems < ActiveRecord::Migration
  def change
    add_column :ordered_items, :status, :string
  end
end
