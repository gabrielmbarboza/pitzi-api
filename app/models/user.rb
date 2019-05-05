class User < ApplicationRecord
  validates_uniqueness_of :cpf, on: :create, message: "must be unique"
  validates_presence_of :cpf, on: :create, message: "can't be blank"
  
  has_many :orders
end