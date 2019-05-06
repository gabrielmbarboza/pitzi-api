class User < ApplicationRecord

  has_many :orders, dependent: :destroy
  
  validates_uniqueness_of :cpf, on: :create, message: "must be unique"
  validates_presence_of :cpf, on: :create, message: "can't be blank"
end