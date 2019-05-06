require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:device_imei) }
  it { should validate_presence_of(:annual_price) }
end
