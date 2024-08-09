require 'rspec'
require './lib/customer'
require './lib/buffet_dish'

RSpec.describe Customer do
  it 'has a name' do
    customer = Customer.new('John')
    expect(customer.name).to eq('John')
  end

  xit 'can say "Ohp! Let me scootch by ya for the Ranch"' do
    customer = Customer.new('John')
    expect(customer.say_ohp).to eq('Ohp! Let me scootch by ya for the Ranch...')
  end

 it 'can fill their plate with dishes, sides, and desserts' do
     customer = Customer.new('Jane')

     # Add items to the customer's plate using the methods on the customer object
     customer.add_dish(BuffetDish.new('Chicken Fingers', 'Medium'))
     # customer.add_side(BuffetSide.new('Baked Beans'))
     # customer.add_dessert(BuffetDessert.new('Ice Cream'))

     # Check that the plate has the correct number of items
     expect(customer.plate[:dishes].count).to eq(1)
     # expect(customer.plate[:sides].count).to eq(1)
     # expect(customer.plate[:desserts].count).to eq(1)
   end
end
