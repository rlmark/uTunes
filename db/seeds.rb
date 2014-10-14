# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..10).each do
  username = Faker::Name.name[0]
  email = Faker::Internet.email
  password = Faker::Internet.password(8)
  Merchant.create
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
>>>>>>> 8eabe1db83e98856c4768497764af0031c1759e6
