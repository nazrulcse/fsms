# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User::ROLES.each do |role|
#   Role.create!(name: role)
# end

# User.create!(email: 'nazrulku07@gmail.com', password: '123456789')

# ['Operation', 'Radio Planing', 'Transmission', 'Network Infrustructure'].each do |dp|
#   Department.create!(name: dp)
# end
#
# 5.times.each do |i|
#   z = Zone.create!(title: "Zone #{i + 1}", code: "#{(i + 1) * (i + 1)}", address: Faker::Address.street_address)
#   Site.create!(title: "Site #{i + 1}", zone_id: z.id, address: Faker::Address.street_address, lat: Faker::Address.latitude, lng: Faker::Address.longitude)
# end

10.times.each do |i|
  User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: '123456789')
end