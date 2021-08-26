# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "[1/2]Destroying all users!"
User.destroy_all

puts "All users destroyed. "
puts "[2/2] Starting new users."

nathan = User.create!(email: "toto@gmail.com", password: "123456", user_name: "Nathan", level: 4)

puts "New user(s) created."
puts "User number : #{User.count}"
