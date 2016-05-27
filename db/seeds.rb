# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Project.destroy_all

10.times do
  project = Project.create(
    name: Faker::App.name,
    description: Faker::Company.catch_phrase,
    start_date: Faker::Date.backward(365),
    projected_end_date: Faker::Date.backward(60),
    actual_end_date: Faker::Date.backward(14),
    budget: Faker::Number.decimal(4,2),
    cost: Faker::Number.decimal(4, 2)
  )
end
