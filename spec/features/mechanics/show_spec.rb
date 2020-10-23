require 'rails_helper'

RSpec.describe 'As a user visiting mechanics show page' do
  before :each do
    @amusement_park1 = AmusementPark.create!(name: "Jolly Ranch", admission_price: 10)
    @mechanic1 = Mechanic.create!(name: "Jim Bob", years_of_experience: 6)
    @mechanic2 = Mechanic.create!(name: "Billy Bob Cooter", years_of_experience: 8)
    @ride1 = @amusement_park1.rides.create!(name: "Big Roller", thrill_rating: 8)
    @ride2 = @amusement_park1.rides.create!(name: "Little Roller", thrill_rating: 3)
    @ride3 = @amusement_park1.rides.create!(name: "New Ride", thrill_rating: 2)
    RideMechanic.create!(mechanic_id: @mechanic1.id, ride_id: @ride2.id)
    RideMechanic.create!(mechanic_id: @mechanic1.id, ride_id: @ride1.id)
  end

  it "displays mechanic's name years of experience, names of all rides they work on, and a form to add a ride to their workload if it exists in the db" do
    visit "/mechanics/#{@mechanic1.id}"

    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@mechanic1.years_of_experience)
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)

      fill_in :search, with: @ride3.id

    expect(page).to have_content(@ride3.name)
  end
end
