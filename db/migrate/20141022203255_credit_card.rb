class CreditCard < ActiveRecord::Migration
  def change
    remove_column :carts, :credit_num, :integer
    add_column :carts, :credit_num, :string
  end
end
