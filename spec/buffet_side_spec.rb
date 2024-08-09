require 'rspec'
require './lib/buffet_side'

RSpec.describe BuffetSide do
  it 'has a name' do
    side = BuffetSide.new()
    expect(side.name).to eq('Mashed Potatoes')
  end

  it 'can be labeled as a comfort food' do
    side = BuffetSide.new('Sweet Corn Pudding', comfort_food: true)
    expect(side.name).to eq('Sweet Corn Pudding')
    expect(side.comfort_food?).to be true
  end
end
