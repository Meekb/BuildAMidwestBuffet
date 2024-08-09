require 'rspec'
require './lib/buffet_dish'

RSpec.describe BuffetDish do
  it 'has a name' do
    dish = BuffetDish.new('Meatloaf')

    expect(dish.name).to eq('Meatloaf')
  end

  xit 'has a type \'main\' by default' do
    dish = BuffetDish.new('Pot Pie')

    expect(dish.type).to eq('main')
  end

  xit 'can have a portion size' do
    dish = BuffetDish.new('Chicken Fingers', portion_size: 'That\'ll do!')

    expect(dish.portion_size).to eq('That\'ll do!')
  end

  xit 'can have a different portion size' do
      dish_1 = BuffetDish.new('Orange Chicken', portion_size: 'Mound')
      dish_2 = BuffetDish.new('Golden Delicious Shrimp', portion_size: 'That\'ll do!')
      dish_3 = BuffetDish.new('Chicken & Noodle Dumplings', portion_size: 'Heaping')

      expect(dish_1.portion_size).to eq('Mound')
      expect(dish_2.portion_size).to eq('That\'ll do!')
      expect(dish_3.portion_size).to eq('Heaping')
  end
end
