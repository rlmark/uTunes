class FixCreditCardNum < ActiveRecord::Migration
  def change
    change_column(:carts, :credit_num, :string)
  end
end
