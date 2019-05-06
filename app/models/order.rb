class Order < ApplicationRecord

  belongs_to :user

  validates_presence_of :device_imei, on: :create, message: "can't be blank"
  validates_presence_of :annual_price, on: :create, message: "can't be blank"
end
