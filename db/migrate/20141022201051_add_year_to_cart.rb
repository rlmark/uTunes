class AddYearToCart < ActiveRecord::Migration
  def change
    add_column :carts, :year, :integer
  end
end
