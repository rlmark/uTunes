class OrderedItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  # belongs_to :merchant, :through => :product  # Cannot have belongs_to through combination

  # preserve belongs_to merchant relat, if we associate ordered items to merchant, it;ll be easier to grab those ordered items which belong to spec merhant. 
end
