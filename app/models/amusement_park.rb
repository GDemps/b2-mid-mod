class AmusementPark < ApplicationRecord
  validates_presence_of :name, :admission_price
  has_many :rides

  def avg_thrill_rating
    rides.average(:thrill_rating).to_f
  end
end
