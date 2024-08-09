require 'rspec'
require './lib/buffet'
require './lib/buffet_dish'
require './lib/buffet_side'
require './lib/buffet_dessert'

RSpec.describe Buffet do
  it 'can have multiple dishes' do
    buffet = Buffet.new
    buffet.add_dish(BuffetDish.new('Meatloaf', portion_size: 'Heaping'))
    buffet.add_dish(BuffetDish.new('Chicken Fingers', portion_size: 'That\'ll do!'))
    expect(buffet.dishes.count).to eq(2)
    expect(buffet.dishes[1].portion_size).to eq('That\'ll do!')
    expect(buffet.dishes[0].portion_size).to eq('Heaping')
  end

  it 'can have multiple sides' do
    buffet = Buffet.new
    buffet.add_side(BuffetSide.new('Mashed Potatoes', comfort_food: true))
    buffet.add_side(BuffetSide.new('Baked Beans'))

    expect(buffet.sides.count).to eq(2)
    expect(buffet.sides[0].comfort_food?).to be true
    expect(buffet.sides[1].comfort_food?).to be false
  end

  it 'can have multiple desserts' do
    buffet = Buffet.new
    buffet.add_dessert(BuffetDessert.new('Apple Pie', classic_midwest: true))
    buffet.add_dessert(BuffetDessert.new('Pudding'))
    expect(buffet.desserts[0].classic_midwest?).to be true
    expect(buffet.desserts.count).to eq(2)
    expect(buffet.desserts[1].classic_midwest?).to be false
  end
end
