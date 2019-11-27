# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name:  "Gabriela",
    email: "gabriela@example.com",
    password:              "foobar",
    password_confirmation: "foobar",
   )

User.create(name:  "Ivan",
    email: "ivan@example.com",
    password:              "foobar",
    password_confirmation: "foobar",
   )

Post.create(
    title: "este es un titulo",
    body: "este es el contenido del post",
    user_id: 1
)   

# 99.times do |n|
# name  = Faker::Name.name
# email = "example-#{n+1}@railstutorial.org"
# password = "password"
# User.create!(name:  name,
#       email: email,
#       password:              password,
#       password_confirmation: password,
#       activated: true,
#       activated_at: Time.zone.now)
# end