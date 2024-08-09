require 'rspec'
require './lib/buffet_dessert'
require './lib/buffet_dish'
require './lib/buffet_side'
require './lib/customer'

RSpec.describe Customer do
  it 'has a name' do
    customer = Customer.new('John')
    expect(customer.name).to eq('John')
  end

  it 'can say "Ohp! Let me scootch by ya for the Ranch..."' do
    customer = Customer.new('John')
    expect(customer.say_ohp).to eq('Ohp! Let me scootch by ya for the Ranch...')
  end

  it 'can fill their plate with dishes, sides, and desserts' do
     customer = Customer.new('Jane')

     customer.add_dish(BuffetDish.new('Chicken Fingers', portion_size: 'Mound'))
     customer.add_side(BuffetSide.new('Baked Beans'))
     customer.add_dessert(BuffetDessert.new('Ice Cream'))

     expect(customer.plate[:dishes].count).to eq(1)
     expect(customer.plate[:sides].count).to eq(1)
     expect(customer.plate[:desserts].count).to eq(1)
  end
end
