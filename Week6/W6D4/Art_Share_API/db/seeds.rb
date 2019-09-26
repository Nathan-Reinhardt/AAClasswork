# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(name: "Carly", email: "carly@yahoo.com")
# User.create!(name: "Paul", email: "paul@gmail.com")
# User.create!(name: "Jeremy", email: "jeremy@hotmail.com")
# User.create!(name: "Wolf", email: "wolfy@mypack.com")

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

User.create!(username: "Carly")
User.create!(username: "Paul")
User.create!(username: "Jeremy")
User.create!(username: "Wolf")

Artwork.create!(title: "First", image_url: "http://first", artist_id: 3)
Artwork.create!(title: "Second", image_url: "http://second", artist_id: 2)
Artwork.create!(title: "Third", image_url: "http://third", artist_id: 1)
Artwork.create!(title: "Fourth", image_url: "http://fourth", artist_id: 2)
Artwork.create!(title: "Fifth", image_url: "http://fifth", artist_id: 1)
Artwork.create!(title: "Sixth", image_url: "http://sixth", artist_id: 3)

ArtworkShare.create!(artwork_id: 3, viewer_id: 4)
ArtworkShare.create!(artwork_id: 2, viewer_id: 2)
ArtworkShare.create!(artwork_id: 6, viewer_id: 4)
ArtworkShare.create!(artwork_id: 4, viewer_id: 1)
ArtworkShare.create!(artwork_id: 1, viewer_id: 3)
ArtworkShare.create!(artwork_id: 5, viewer_id: 4)
ArtworkShare.create!(artwork_id: 3, viewer_id: 2)
ArtworkShare.create!(artwork_id: 2, viewer_id: 4)
ArtworkShare.create!(artwork_id: 5, viewer_id: 3)
ArtworkShare.create!(artwork_id: 4, viewer_id: 2)
