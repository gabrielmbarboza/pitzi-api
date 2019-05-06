require 'rails_helper'

RSpec.describe User, type: :model do

  before { FactoryBot.build(:user) }

  it { should have_many(:orders).dependent(:destroy) }

  it { should { validate_uniqueness_of(:cpf).case_insensitive } }

  it { should validate_presence_of(:cpf) }
end
