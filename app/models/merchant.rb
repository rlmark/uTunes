class Merchant < ActiveRecord::Base
  validates :email, presence: true
  validates :email, format: {with: /@/}
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: {
    minimum: 3,
    maximum: 100,
    too_short: "You must have at least %{count} characters in your username",
    too_long: "%{count} characters is the maximum allowed"
    }
  validates :password, length: {
    minimum: 6,
    maximum: 100,
    too_short: "You must have at least %{count} characters in a password",
    too_long: "%{count} characters is the maximum allowed"
    }
  validates :name, presence: true

  has_many :products

end
