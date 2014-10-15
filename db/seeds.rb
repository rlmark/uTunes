# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# Product Seeding
(1..100).each do
  name = Faker::Commerce.product_name
  product = {
    name: name + " album",
    stock: rand(0..10),
    merchant_id: rand(1..10),
    description: Faker::Lorem.sentence(2),
    price: rand(500..5000),
    image: Faker::Avatar.image( /[a-z]+/.match(name.downcase)[0], "300x300")
  }
  Product.create(product)
end



# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..10).each do
  name = Faker::Company.name
  username = /[a-z]+/.match(name.downcase)[0]
  merchant = {
    name: name,
    username: username,
    email: username + "@" + username + ".com",
    password: username.reverse
  }
  Merchant.create(merchant)
end




















# (1..100).each do
#
#   name = Faker::Company.name
#   username = /[a-z]+/.match(name.downcase)[0]
#   vendor = {
#   name: name,
#   no_of_employees: rand(1..10),
#   market_id: rand(1..3),
#   username: username,
#   password: username.reverse}
#
#   Vendor.create(vendor)
# end
















categories = ["Norwegian Death Metal",
  "Trap Music", "Trip Hop", "Hot Jazz",
  "Indian Flute Music", "Weeding Music", "Country Pop",
  "Traditional Cowboy", "Breakbeat","West Coast Rap",
  "Indie Pop", "Inspirational"]

categories.each do |category_name|
  Category.create(name: category_name)
end
