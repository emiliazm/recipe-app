require 'rails_helper'

RSpec.describe Food, type: :model do
  user = User.new(name: 'Axel', id: 1)
  user.save
  subject { Food.new(name: 'food1', measurement_unit: 'kg', price: 10, quantity: 8, user_id: user.id) }
  before { subject.save }

  it 'all info from food' do
    expect(subject.user_id).not_to be_nil
    expect(subject.name).to eq('food1')
    expect(subject.measurement_unit).to eq('kg')
    expect(subject.price).to eq(10)
    expect(subject.quantity).to eq(8)
  end
end
