class Cart < ActiveRecord::Base
  has_many :ordered_items



    validates :email, presence: true
    validates :email, format: {with: /@/}
  #
    validates :address,:city,:state, :zip, :name, :credit_cvv, presence: true
  #
  # validates :credit_num, presence: true
  #  validates :credit_num, format: {with: /\A\d{9}/,
  #  :message => "Credit cards numbers require 10 digits with no spaces"}
  #
  #  validates :month, presence: true
  #  validates :month, :numericality => {:greater_than => 0,
  #    :less_than_or_equal_to => 12, :message => "Please choose a valid month"}
  #
  #  validates :year, presence: true
  #  validates :year, :numericality => {:greater_than => 2014,
  #    :message => "Expiration year must be at least 2014"}
  end

end
