RSpec.describe BuffetLine do
  it 'can add customers to the line' do
    line = BuffetLine.new
    customer_1 = Customer.new('John')
    customer_2 = Customer.new('Jane')
    line.add_customer(customer_1)
    line.add_customer(customer_2)
    expect(line.customers.count).to eq(2)
  end

  it 'can serve customers from the buffet' do
    buffet = Buffet.new
    buffet.add_dish(BuffetDish.new('Meatloaf'))
    buffet.add_side(BuffetSide.new('Mashed Potatoes'))
    buffet.add_dessert(BuffetDessert.new('Apple Pie'))

    line = BuffetLine.new
    customer = Customer.new('John')
    line.add_customer(customer)
    line.serve_customer(customer, buffet)

    expect(customer.plate.dishes.count).to eq(1)
    expect(customer.plate.sides.count).to eq(1)
    expect(customer.plate.desserts.count).to eq(1)
  end
end
