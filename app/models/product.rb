class Product < ActiveRecord::Base
  validates :album_name, presence: true
  validates :artist, presence: true
  validates :stock, presence: true
  validates :stock, numericality: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :image, presence: true

  belongs_to :merchant
  has_many :ordered_items
  has_many :ratings
  has_and_belongs_to_many :categories
end
