require 'rails_helper'

RSpec.describe 'As a user visiting mechanics index page' do
  before :each do
    @mechanic1 = Mechanic.create!(name: "Jim Bob", years_of_experience: 6)
    @mechanic2 = Mechanic.create!(name: "Billy Bob Cooter", years_of_experience: 8)
  end
  it "displays all mechanics names and years of experience" do
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@mechanic1.years_of_experience)
    expect(page).to have_content(@mechanic2.name)
    expect(page).to have_content(@mechanic2.years_of_experience)
  end
end
