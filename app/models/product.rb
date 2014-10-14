class Product < ActiveRecord::Base
  belongs_to :merchant
  has_many :ordered_items
  has_many :ratings
  has_and_belongs_to_many :categories
end
