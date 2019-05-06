FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    cpf { Faker::IDNumber.brazilian_citizen_number }
  end
end