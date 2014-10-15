class Merchant < ActiveRecord::Base
  # validates :email, presence: true
  # validates :email, format: {with: /@/}
  # validates :username, presence: true
  # validates :username, uniqueness: true
  # validates :username, length: {greater_than: 1, less_than: 100}
  # validates :password, length: {greater_than: 1, less_than: 100}
  # validates :name, presence: true

  has_many :products

end
