require 'rspec'
require './lib/buffet_dessert'
require './lib/buffet_dish'
require './lib/buffet_side'
require './lib/customer'

RSpec.describe Customer do
  it 'has a name' do
    customer = Customer.new('Mike')
    expect(customer.name).to eq('Mike')
  end

  xit 'can say "Ohp! Let me scootch by ya for the Ranch..."' do
    customer = Customer.new('Barb')
    expect(customer.say_ohp).to eq('Ohp! Let me scootch by ya for the Ranch...')
  end

  xit 'tracks the number of times it says \'Ohp\'' do
    customer = Customer.new('Barb')
    customer.say_ohp
    expect(customer.ohp_count).to eq(1)
  end

  xit 'can fill their plate with dishes, sides, and desserts' do
     customer = Customer.new('Scooter')

     customer.add_dish(BuffetDish.new('Chicken Fingers', portion_size: 'Mound'))
     customer.add_side(BuffetSide.new('Baked Beans'))
     customer.add_dessert(BuffetDessert.new('Ice Cream'))

     expect(customer.plate[:dishes].count).to eq(1)
     expect(customer.plate[:sides].count).to eq(1)
     expect(customer.plate[:desserts].count).to eq(1)
  end
end
