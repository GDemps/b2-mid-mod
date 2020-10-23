require 'rails_helper'

describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many :rides }
  end

  describe "instance method" do
    it "avg_thrill_rating test" do
      amusement_park1 = AmusementPark.create!(name: "Jolly Ranch", admission_price: 10)
      roller_coaster1 = amusement_park1.rides.create!(name: "Big Roller", thrill_rating: 8)
      roller_coaster2 = amusement_park1.rides.create!(name: "Little Roller", thrill_rating: 3)

      expect(amusement_park1.avg_thrill_rating).to eq(5.5)
    end
  end
end
