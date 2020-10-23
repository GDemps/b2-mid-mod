require 'rails_helper'

RSpec.describe 'As a user visiting amusement parks show page' do
  before :each do
    @amusement_park1 = AmusementPark.create!(name: "Jolly Ranch", admission_price: 10)
    @amusement_park2 = AmusementPark.create!(name: "Wild Rides", admission_price: 4)
    @roller_coaster1 = @amusement_park1.rides.create!(name: "Big Roller", thrill_rating: 8)
    @roller_coaster2 = @amusement_park1.rides.create!(name: "Little Roller", thrill_rating: 3)
    @mechanic1 = Mechanic.create!(name: "Jim Bob", years_of_experience: 6)
    @mechanic2 = Mechanic.create!(name: "Billy Bob Cooter", years_of_experience: 8)
  end
  it "displays the name and price of park, names of all rides with the park's avg thrill rating" do
    visit "/amusement_parks/#{@amusement_park1.id}"

    expect(page).to have_content(@amusement_park1.name)
    expect(page).to have_content(@amusement_park1.admission_price)

    expect(page).to have_content("Average Thrill Rating of Rides: #{@amusement_park1.avg_thrill_rating}")
  end
end
