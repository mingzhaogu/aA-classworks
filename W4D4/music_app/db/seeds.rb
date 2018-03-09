# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.destroy_all
User.destroy_all

people = ['a', 'b', 'c']

people.each do |person|
  User.create!(email: person, password: 'password')
end


bands = ['JJ Lin',
  'Simple Plan',
  'Chainsmokers',
  'Lifehouse',
  'Switchfoot',
  'Ed Sheeran',
  'MayDay']

bands.each do |band|
  Band.create!(name: band)
end


10.times do
  Album.create!(
    band_id: (1..bands.count).to_a.sample.to_i,
    title: Faker::Music.instrument,
    year: (1990 + rand(118))
  )
end
