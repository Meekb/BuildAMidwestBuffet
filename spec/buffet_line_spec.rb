require 'rspec'
require './lib/buffet'
require './lib/buffet_dessert'
require './lib/buffet_dish'
require './lib/buffet_line'
require './lib/buffet_side'
require './lib/customer'

RSpec.describe BuffetLine do
  it 'can add customers to the line' do
    line = BuffetLine.new
    customer_1 = Customer.new('John')
    customer_2 = Customer.new('Jane')
    line.add_customer(customer_1)
    line.add_customer(customer_2)
    expect(line.customers.count).to eq(2)
  end

  it 'can serve customers' do
    buffet = Buffet.new
    buffet.add_dish(BuffetDish.new('Meatloaf'))
    buffet.add_side(BuffetSide.new('Mashed Potatoes'))
    buffet.add_dessert(BuffetDessert.new('Apple Pie'))

    line = BuffetLine.new
    customer_1 = Customer.new('John')
    customer_2 = Customer.new('Jane')
    line.add_customer(customer_1)
    line.add_customer(customer_2)

    line.serve_customer(buffet)

    expect(customer_1.plate[:dishes].first.name).to eq('Meatloaf')
    expect(customer_1.plate[:sides].first.name).to eq('Mashed Potatoes')
    expect(customer_1.plate[:desserts].first.name).to eq('Apple Pie')
  end
end
