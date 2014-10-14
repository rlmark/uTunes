class OrderedItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  belongs_to :merchant, through: :product
end
