FactoryBot.define do
  factory :order do
    device_imei { '123454567878932' }
    device_model { 'Moto G3' }
    annual_price { 330.00 }
    installments { 12 }
    user { nil }
  end
end