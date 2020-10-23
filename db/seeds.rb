# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@amusement_park1 = AmusementPark.create!(name: "Jolly Ranch", admission_price: 10)
@mechanic1 = Mechanic.create!(name: "Jim Bob", years_of_experience: 6)
@mechanic2 = Mechanic.create!(name: "Billy Bob Cooter", years_of_experience: 8)
@ride1 = @amusement_park1.rides.create!(name: "Big Roller", thrill_rating: 8)
@ride2 = @amusement_park1.rides.create!(name: "Little Roller", thrill_rating: 3)
RideMechanic.create!(mechanic_id: @mechanic1.id, ride_id: @ride1.id)
RideMechanic.create!(mechanic_id: @mechanic1.id, ride_id: @ride2.id)
