require 'rspec'
require './lib/buffet_side'

RSpec.describe BuffetSide do
  it 'has a name' do
    side = BuffetSide.new('Mashed Potatoes')
    expect(side.name).to eq('Mashed Potatoes')
  end

  xit 'has a type \'side\'  by default' do
    side = BuffetSide.new('Fried Okra')
    expect(side.name).to eq('Fried Okra')
    expect(side.type).to eq('side')
  end

  xit 'can be labeled as a comfort food' do
    side_1 = BuffetSide.new('Southern Baked Mac & Cheese', comfort_food: true)
    side_2 = BuffetSide.new('Fried Ravioli')

    expect(side_1.name).to eq('Southern Baked Mac & Cheese')
    expect(side_1.comfort_food?).to be true

    expect(side_2.name).to eq('Fried Ravioli')
    expect(side_2.comfort_food?).to be false
  end

  xit 'starts with a count of 20' do
    side = BuffetSide.new('Fried Okra')
    expect(side.name).to eq('Fried Okra')
    expect(side.count).to eq(20)
  end

  xit 'can decrease the count' do
    side = BuffetSide.new('Fried Okra')
    expect(side.name).to eq('Fried Okra')
    expect(side.count).to eq(20)
    expect(side.decrease_count).to eq(15)
  end

  xit 'can run out of the side' do
    side = BuffetSide.new('Fried Okra')
    expect(side.name).to eq('Fried Okra')
    expect(side.count).to eq(20)
    side.decrease_count
    side.decrease_count
    side.decrease_count
    side.decrease_count
    expect(side.count).to eq(0)
  end

  xit 'can can be refilled' do
    side = BuffetSide.new('Fried Okra')
    expect(side.name).to eq('Fried Okra')
    side.decrease_count
    side.decrease_count
    side.decrease_count
    side.decrease_count
    expect(side.count).to eq(0)
    side.refill_side
    expect(side.count).to eq(20)
  end
end
