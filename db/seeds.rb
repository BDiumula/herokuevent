# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::UniqueGenerator.clear

User.destroy_all


10.times do
  User.create!(email: Faker::Internet.unique.email(domain: 'yopmail.com'), password: Faker::Lorem.characters(number: 10), description: Faker::ChuckNorris.fact, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

10.times do
  Event.create!(start_date: Faker::Time.between_dates(from: Date.today, to: Date.today + 357, period: :day), duration:Faker::Time.forward(days: 23, period: :morning) ,title:Faker::Company.buzzword , description:Faker::Lorem.paragraph , price:Faker::Commerce.price  ,location:Faker::Address.city, user_id: User.all.sample)
end

10.times do
  Attendance.create!(stripe_customer_id: "BLABLABLA", user: User.all.sample, event: Event.all.sample)
end
