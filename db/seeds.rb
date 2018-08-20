# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
  User.create(name: Faker::Name.name, real_email: Faker::Internet.email)
end

4.times do
  Victim.create(name: Faker::Name.name, real_email: Faker::Internet.email)
end

5.times do
  SpamType.create(name: Faker::Food.dish)

10.times do
  Email.create(contents: Faker::Lorem.sentence(5), user_id: Faker::Number.between(1,3), victim_id: Faker::Number.between(1,4), spam_type_id: Faker::Number.between(1,5))
end

10.times do
  FakeEmail.create(email: Faker::Internet.email, user_id: Faker::Number.between(1,3))
end
