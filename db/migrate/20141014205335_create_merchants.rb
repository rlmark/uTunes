class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
