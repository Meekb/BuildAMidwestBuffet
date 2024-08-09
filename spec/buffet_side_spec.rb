require 'rspec'
require './lib/buffet_side'

RSpec.describe BuffetSide do
  it 'has a name' do
    side = BuffetSide.new('Mashed Potatoes')
    expect(side.name).to eq('Mashed Potatoes')
  end

  xit 'can be labeled as a comfort food' do
    side_1 = BuffetSide.new('Southern Baked Mac & Cheese', comfort_food: true)
    side_2 = BuffetSide.new('Fried Ravioli')

    expect(side_1.name).to eq('Southern Baked Mac & Cheese')
    expect(side_1.comfort_food?).to be true

    expect(side_2.name).to eq('Fried Ravioli')
    expect(side_2.comfort_food?).to be false
  end
end
