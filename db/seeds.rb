# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "[1/3] Destroying all favorites and users..."
puts "..."
Favorite.destroy_all
User.destroy_all
puts "Destroyed.✅ "

puts "[2/3] Seeding new users..."
puts "..."
nathan = User.create!(email: "toto@gmail.com", password: "123456", user_name: "Nathan", level: 4)
puts "#{User.count} new user(s) created. ✅"

puts "[3/3] Seeding new favorites..."
puts "..."
Favorite.create!(user_id: nathan.id, topo_id: 53)
puts "#{Favorite.count} new favorite(s) created. ✅"
