# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Member.destroy_all

# Creation des membres
50.times do |x|
  member = Member.create!(name: Faker::Name.first_name, last_name: Faker::Name.last_name, date: Faker::Date.between(from: '1980-01-01', to: '2020-09-08'))
  puts "Member n°#{x+1} created"
end