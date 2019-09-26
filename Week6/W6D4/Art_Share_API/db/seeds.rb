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

ArtworkShare.destroy_all
Comment.destroy_all
Artwork.destroy_all
User.destroy_all

user1 = User.create!(username: "Carly")
user2 = User.create!(username: "Paul")
user3 = User.create!(username: "Jeremy")
user4 = User.create!(username: "Wolf")

art1 = Artwork.create!(title: "First", image_url: "http://first", artist_id: user3.id)
art2 = Artwork.create!(title: "Second", image_url: "http://second", artist_id: user2.id)
art3 = Artwork.create!(title: "Third", image_url: "http://third", artist_id: user1.id)
art4 = Artwork.create!(title: "Fourth", image_url: "http://fourth", artist_id: user2.id)
art5 = Artwork.create!(title: "Fifth", image_url: "http://fifth", artist_id: user1.id)
art6 = Artwork.create!(title: "Sixth", image_url: "http://sixth", artist_id: user3.id)

ArtworkShare.create!(artwork_id: art3.id, viewer_id: user4.id)
ArtworkShare.create!(artwork_id: art2.id, viewer_id: user2.id)
ArtworkShare.create!(artwork_id: art6.id, viewer_id: user4.id)
ArtworkShare.create!(artwork_id: art4.id, viewer_id: user1.id)
ArtworkShare.create!(artwork_id: art1.id, viewer_id: user3.id)
ArtworkShare.create!(artwork_id: art5.id, viewer_id: user4.id)
ArtworkShare.create!(artwork_id: art3.id, viewer_id: user2.id)
ArtworkShare.create!(artwork_id: art2.id, viewer_id: user4.id)
ArtworkShare.create!(artwork_id: art5.id, viewer_id: user3.id)
ArtworkShare.create!(artwork_id: art4.id, viewer_id: user2.id)

Comment.create!(body: "I really liked this piece! =)", artwork_id: art3.id, user_id: user2.id)
Comment.create!(body: "This could have been better.", artwork_id: art5.id, user_id: user2.id)
Comment.create!(body: "There is a star in your future.", artwork_id: art6.id, user_id: user4.id)
Comment.create!(body: "Bring me some cookies!", artwork_id: art2.id, user_id: user3.id)
Comment.create!(body: "Big bad Wolf will be bringing it down!", artwork_id: art4.id, user_id: user1.id)
Comment.create!(body: "Exelcior!", artwork_id: art3.id, user_id: user4.id)