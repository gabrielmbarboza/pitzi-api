# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do
  user = User.create(
    name: Faker::Name.name, 
    email: Faker::Internet.email, 
    cpf: Faker::IDNumber.brazilian_citizen_number
  )

  Order.create(
    device_imei: Faker::Number.number(15),
    device_model: Faker::Device.model_name,
    annual_price: Faker::Commerce.price,
    installments: rand(0..12),
    user: user
  )
end
