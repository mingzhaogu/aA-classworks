# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create(user_name: Faker::Name.name,
    password: 'password'
  )
end

10.times do
  Cat.create(name: Faker::Name.name,
      birth_date: Faker::Date.between(10.years.ago, Date.today),
      color: Cat::CAT_COLORS.sample,
      sex: %w(M F).sample,
      description: Faker::Friends.quote,
      user_id: User.all.sample.id
  )
end

CatRentalRequest.create!(cat_id: Cat.first.id,
  start_date: '2018-04-01',
  end_date: '2018-04-07',
  requester_id: User.all.sample.id
)
