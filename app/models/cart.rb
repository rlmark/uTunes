class Cart < ActiveRecord::Base
  has_many :ordered_items

  with_options if: :ready_to_pay? do |f|

    f.validates :email, presence: true, if: :ready_to_pay?
    f.validates :email, format: {with: /@/}, if: :ready_to_pay?
    #
    f.validates :address,:city,:state, :zip, :name, :credit_cvv, presence: true, if: :ready_to_pay?
    #
    f.validates :credit_num, presence: true
    f.validates :credit_num, format: {with: /\A\d{9}\Z/,
      :message => "Credit cards numbers require 10 digits with no spaces"}
    #
    f.validates :month, presence: true
    f.validates :month, :numericality => {:greater_than => 0,
        :less_than_or_equal_to => 12, :message => "Please choose a valid month"}
    #
    f.validates :year, presence: true
    f.validates :year, :numericality => {:greater_than => 2014,
        :message => "Expiration year must be at least 2014"}
  end


  def ready_to_pay?
    status == "closed"
  end


end
