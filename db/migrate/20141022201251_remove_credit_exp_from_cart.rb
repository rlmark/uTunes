class RemoveCreditExpFromCart < ActiveRecord::Migration
  def change
    remove_column :carts, :credit_exp, :integer
  end
end
