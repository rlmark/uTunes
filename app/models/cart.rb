class Cart < ActiveRecord::Base
  has_many :ordered_items

  with_options if: :ready_to_pay? do |f|
  #
    f.validates :email, :presence => {:message => " is required"}
    f.validates :address,:city,:state, :credit_num, :zip, :name, :credit_cvv,
      :presence => {:message => " is required"}
  #   #

    f.validates :credit_num, format: {with: /\A\d{10}\Z/,
       :message => " Credit cards numbers require 10 digits with no spaces"}
  #   #
    f.validates :month, :presence => {:message => " is required"}
    f.validates :month, :numericality => {:greater_than => 0,
       :less_than_or_equal_to => 12, :message => " Please choose a valid month 1 - 12"}
  #   #
    f.validates :year, :presence => {:message => " is required"}
    f.validates :year, :numericality => {:greater_than => 2013,
         :message => " Expiration year must be at least 2014"}
  end


  def ready_to_pay?
    status == "closed"
  end


end
