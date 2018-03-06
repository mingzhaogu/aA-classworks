# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.all.destroy_all
Artwork.all.destroy_all
ArtworkShare.all.destroy_all

names = ['Dolores', 'William', 'Arnold', 'Ford', 'ManinBlack']
# emails = ['Dolores@westworld.com', 'William@westworld.com', 'Arnold@westworld.com', 'Ford@westworld.com', 'ManinBlack@westworld.com']

5.times do |idx|
  User.create!(username: names[idx]) #, email: emails[idx])
end

titles = ['title1', 'title2', 'title3', 'title4']
image_urls = ['url1', 'url2', 'url3', 'url4']
artist_ids = [User.first.id, User.all[1].id, User.all[2].id, User.all[2].id]

4.times do |idx|
  Artwork.create!(title: titles[idx], image_url: image_urls[idx], artist_id: artist_ids[idx])
end

artwork_ids = [Artwork.first.id, Artwork.all[1].id, Artwork.all[2].id, Artwork.all[2].id].shuffle!
artist_ids.shuffle!

4.times do |idx|
  ArtworkShare.create!(artwork_id: artwork_ids[idx], viewer_id: artist_ids[idx])
end
# ArtworkShare.create!(artwork_id: artwork_ids[1], viewer_id: artist_ids[2])
