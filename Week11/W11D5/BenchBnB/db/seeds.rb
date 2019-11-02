# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Bench.destroy_all

User.create!(id: 1, username: 'kate', password: 'password')
User.create!(id: 2, username: 'paul', password: 'password')
User.create!(id: 3, username: 'carl', password: 'password')

Bench.create!(id: 1, description: 'Twin Peaks is amazing', lat: 37.754087, lng: -122.447200)
Bench.create!(id: 2, description: "Go see fish at Fisherman's Wharf", lat: 37.808390, lng: -122.409626)
Bench.create!(id: 3, description: 'Lots of hardworking people in Dogpatch', lat: 37.758261, lng: -122.389857)
