# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# Merchants
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

merchant_count = Merchant.all.length

# Product
(1..100).each do
  name = Faker::Commerce.product_name
  product = {
    active: true,
    artist: Faker::Name.name,
    album_name: name + " album",
    stock: rand(0..10),
    merchant_id: rand(1..merchant_count),
    description: Faker::Lorem.sentence(2),
    price: rand(500..5000),
    image: Faker::Avatar.image( /[a-z]+/.match(name.downcase)[0], "300x300")
  }
  Product.create(product)
end

# Ratings
(1..150).each do
  id = (1..100).to_a.shuffle.first
  Rating.create(stars: rand(1..5), comments: Faker::Lorem.sentence(1), product_id: id)
end



# CategoriesProducts
Product.all.each do |product|
  array = (1..12).to_a.shuffle
  CategoriesProducts.create(product_id: product.id, category_id: array[0])
  CategoriesProducts.create(product_id: product.id, category_id: array[1])
end

# Categories
categories = ["Norwegian Death Metal",
  "Trap Music", "Trip Hop", "Hot Jazz",
  "Indian Flute Music", "Weeding Music", "Country Pop",
  "Traditional Cowboy", "Breakbeat","West Coast Rap",
  "Indie Pop", "Inspirational"]

categories.each do |category_name|
  Category.create(name: category_name)
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
