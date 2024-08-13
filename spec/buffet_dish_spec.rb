require 'rspec'
require './lib/buffet_dish'

RSpec.describe BuffetDish do
  it 'has a name' do
    dish = BuffetDish.new('Meatloaf')

    expect(dish.name).to eq('Meatloaf')
  end

  xit 'has a a portion size' do
    dish = BuffetDish.new('Chicken Fingers')

    expect(dish.portion_size).to eq('Heaping')
  end

  xit 'can have a different portion size' do
      dish_1 = BuffetDish.new('Orange Chicken', portion_size: 'Mound')
      dish_2 = BuffetDish.new('Golden Delicious Shrimp', portion_size: 'That\'ll do!')
      dish_3 = BuffetDish.new('Chicken & Noodle Dumplings')

      expect(dish_1.portion_size).to eq('Mound')
      expect(dish_2.portion_size).to eq('That\'ll do!')
      expect(dish_3.portion_size).to eq('Heaping')
  end

  xit 'starts with a count of 25' do
    dish = BuffetDish.new('Chicken Fingers')
    expect(dish.count).to eq(25)
  end

  xit 'can decrease the count' do
    dish = BuffetDish.new('Chicken Fingers')
    expect(dish.count).to eq(25)

    dish.decrease_count
    expect(dish.count).to eq(20)
  end

  xit 'can run out of the dish' do
    dish = BuffetDish.new('Chicken Fingers')
    expect(dish.count).to eq(25)
    dish.decrease_count
    dish.decrease_count
    dish.decrease_count
    dish.decrease_count
    dish.decrease_count
    expect(dish.count).to eq(0)
  end

  xit 'can can be refilled' do
    dish = BuffetDish.new('Chicken Fingers')
    expect(dish.count).to eq(25)

    dish.decrease_count
    dish.decrease_count
    dish.decrease_count
    dish.decrease_count
    dish.decrease_count
    expect(dish.count).to eq(0)

    expect(dish.refill_dish).to eq(25)
  end
end
