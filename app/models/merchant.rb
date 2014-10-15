class Merchant < ActiveRecord::Base
  validates :email, presence: true
  validates :email, format: {with: /@/}
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: {less_than: 50}
  validates :password, length: {greater_than: 6, less_than: 50}
  validates :name, presence: true

  has_many :products
end
