require 'rspec'
require './lib/buffet_dish'

RSpec.describe BuffetDish do
  it 'has a name' do
    dish = BuffetDish.new('Meatloaf', portion_size = 'Large')
    expect(dish.name).to eq('Meatloaf')
  end

  it 'can have a portion size' do
    dish = BuffetDish.new('Chicken Fingers', portion_size = 'Large')
    expect(dish.portion_size).to eq('Large')
  end

  it 'can have a different portion size' do
      dish_1 = BuffetDish.new('Orange Chicken', portion_size = 'Medium')
      expect(dish_1.portion_size).to eq('Medium')
      dish_2 = BuffetDish.new('Golden Delicious Shrimp', portion_size = 'Small')
      expect(dish_2.portion_size).to eq('Small')
  end
end
