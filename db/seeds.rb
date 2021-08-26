# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
User.destroy_all
Topo.destroy_all
Address.destroy_all
River.destroy_all

puts "Destroyed all! Starting new seeds!"

nathan = User.create!(email: "toto@gmail.com", password: "123456", user_name: "Nathan", level: 4)

address1 = Address.create!(name: "Pont du hameau des Cayres", latitude: 34.76876, longitude: 65.657657)
address2 = Address.create!(name: "Pont du wagon", latitude: 3.76876, longitude: 5.657657)
address3 = Address.create!(name: "Place bellecour", latitude: 56.76, longitude: 5.657)

river1 = River.create!(name:'Besorgues', country: 'France', region: "Auvergne-Rhônes-Alpes", department: 'Ardèche(07)')

topo1 = Topo.create!(name: 'P1', level: 5, length: 3, river_id: river1.id, departure_id: address1.id, arrival_id: address2.id)
topo2 = Topo.create!(name: 'P2', level: 3, length: 6, river_id: river1.id, departure_id: address2.id, arrival_id: address3.id)
topo3 = Topo.create!(name: 'P3', level: 2, length: 4, river_id: river1.id, departure_id: address3.id, arrival_id: address1.id)

topo_detail1 = TopoDetail.create!(topo_id: topo1.id, category:'Présentation', content: "Rivière magnifique avec de jolis passages")
topo_detail2 = TopoDetail.create!(topo_id: topo2.id, category:'Logistique', content: "Embarquement : pont du hameau des Cayres, Débarquement : confluent de la Volane (RG)")
topo_detail3 = TopoDetail.create!(topo_id: topo3.id, category:"Au fil de l'eau", content: "- visible de la route : paquet d'arbre sur un passage
                                                                          -1 barrage qu'il vaut mieux porter (débarquement RD)
                                                                          -gros rappel sur une étroiture en V (cf. photo)
                                                                          -grand toboggan très marrant sur la fin")

comment1 = Comment.create!(category: 'alert', active: true, alert_type: 'extra-terrestre',description: "un ovni dans la rivière", severity: 2, user_id: nathan.id, topo_id: topo1.id )

comment2 = Comment.create!(category: 'alert', active: false, alert_type: 'animal volant',description: "attaque griffe de guépard", severity: 1, user_id: nathan.id, topo_id: topo2.id )

comment3 = Comment.create!(category: 'alert', active: true, alert_type: 'foudre divine',description: "attaque de confettis divins partout dans la rivière!!!Courrez!!!", severity: 2, user_id: nathan.id, topo_id: topo3.id )

puts "topos : #{Topo.count}"
puts "Done!"
