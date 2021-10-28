# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.destroy_all
Dogsitter.destroy_all
Dog.destroy_all
Stroll.destroy_all

require 'faker'


#initialisation du nombre de variables a seed
nb_city = 20
nb_dog = 500
nb_sitters = 200
nb_stroll = 1000
nb_dogstrolls = 2000
dogstrolls = []
strolls = []
dogsitters = []
cities = []
dogs = []


nb_city.times do |x|
  city = City.create(city_name: Faker::Address.city)
  cities << city
  puts "Création de la ville n°#{x}"
end

nb_dog.times do |x|
  dog = Dog.create(
    name: Faker::Creature::Dog.name, 
    city_id: cities[rand(0..nb_city-1)].id)
  dogs << dog
  puts "Création du chien n°#{x}"
end


nb_sitters.times do |x|
  sitter = Dogsitter.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name, 
    city_id: cities[rand(0..nb_city-1)].id)
  dogsitters << sitter
  puts "Création du Dogsitter n°#{x}"
end
  
nb_stroll.times do |x|
  stroll = Stroll.create(
    date: Faker::Date.between(from: 2.days.ago, to: 3.year.from_now),
    dogsitter_id: dogsitters[rand(0..nb_sitters-1)].id)
  strolls << stroll
  puts "Création de la balade n°#{x}"
end

nb_dogstrolls.times do |x|
  dogstroll  = DogStroll.create(
    stroll_id: strolls[rand(0..nb_stroll-1)].id,
		dog_id: dogs[rand(0..nb_dog-1)].id)
  dogstrolls << dogstroll
  puts "Création de la balade du chien n°#{x}"
end