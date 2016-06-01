# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Project.destroy_all
Booking.destroy_all
Task.destroy_all
Resource.destroy_all

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

5.times do
  User.create(
    name: Faker::App.name,
    email: Faker::Internet.email,
    password: 'new!!password',
    password_confirmation: 'new!!password',
  )
end

100.times do
  Task.create(
    name: Faker::App.name,
    description: Faker::Company.catch_phrase,
    start_date: Faker::Date.backward(30),
    due_date: Faker::Date.forward(60),
    status: rand(2),
    user_id: User.order("RAND()").first.id,
    project_id: Project.order("RAND()").first.id
  )
end

15.times do
  Resource.create(
    name: Faker::App.name,
    description: Faker::Lorem.paragraph(2)
  )
end

100.times do
  Booking.create(
  project_id: Project.order("RAND()").first.id,
  resource_id: Resource.order("RAND()").first.id,
  start_datetime: Faker::Time.forward(30),
  end_datetime: Faker::Time.forward(60)
  )
end
