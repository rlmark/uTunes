class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :status
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :name
      t.integer :credit_num
      t.integer :credit_cvv
      t.string :credit_exp

      t.timestamps
    end
  end
end
