class AddMonthToCart < ActiveRecord::Migration
  def change
    add_column :carts, :month, :integer
  end
end
