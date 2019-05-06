FactoryBot.define do
  factory :order do
    device_imei { Faker::Number.number(15) }
    device_model { Faker::Device.model_name }
    annual_price { Faker::Commerce.price }
    installments { 12 }
    user { nil }
  end
end