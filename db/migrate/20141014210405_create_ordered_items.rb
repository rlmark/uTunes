class CreateOrderedItems < ActiveRecord::Migration
  def change
    create_table :ordered_items do |t|
      t.integer :quantity
      t.integer :product_id

      t.timestamps
    end
  end
end
