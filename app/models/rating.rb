class Rating < ActiveRecord::Base
  validates :stars, presence: true
  validates :stars, inclusion: {:in =>1..5, :message => "You an only give a rating between 1 and 5 stars"} 

  belongs_to :product
end
