# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.all.destroy_all

names = ['Dolores', 'William', 'Arnold', 'Ford', 'Man in Black']
emails = ['Dolores@westworld.com', 'William@westworld.com', 'Arnold@westworld.com', 'Ford@westworld.com', 'ManinBlack@westworld.com']

5.times do |idx|
  User.create!(name: names[idx], email: emails[idx])
end
