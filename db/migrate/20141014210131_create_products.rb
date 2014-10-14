class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :merchant_id
      t.integer :stock
      t.integer :price
      t.string :image

      t.timestamps
    end
  end
end
