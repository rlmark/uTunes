class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :stars
      t.text :comments
      t.integer :product_id

      t.timestamps
    end
  end
end
