require 'rspec'
require './lib/buffet'
require './lib/buffet_dessert'
require './lib/buffet_dish'
require './lib/buffet_line'
require './lib/buffet_side'
require './lib/buffet_staff'
require './lib/customer'

RSpec.describe BuffetStaff do

  it 'has a crew count' do
    crew = BuffetStaff.new
    expect(crew.crew_count).to eq(25)
  end

  xit 'has a hustle meter' do
    crew = BuffetStaff.new
    expect(crew.hustle_meter).to eq(10)
  end

  xit 'checks the hustle meter' do
    crew = BuffetStaff.new
    expect(crew.check_hustle).to eq(10)
  end

  xit 'decreases hustle' do
    crew = BuffetStaff.new
    expect(crew.decrease_hustle).to eq(9)
  end

  xit 'refills empty dishes' do
    buffet = Buffet.new
    crew = BuffetStaff.new

    buffet.add_dish(BuffetDish.new('Cashew Chicken'))
    buffet.add_side(BuffetSide.new('Crab Rangoon'))
    buffet.add_dessert(BuffetDessert.new('Jello Salad', classic_midwest: true))

    customer_1 = Customer.new('Joe')
    customer_2 = Customer.new('Jerrilyn')
    customer_3 = Customer.new('Daryl')
    customer_4 = Customer.new('Richey')
    customer_5 = Customer.new('Tim')
    customer_6 = Customer.new('Louann')

    buffet.increase_line(customer_1)
    buffet.increase_line(customer_2)
    buffet.increase_line(customer_3)
    buffet.increase_line(customer_4)
    buffet.increase_line(customer_5)
    buffet.increase_line(customer_6)

    buffet.serve

    expect(buffet.dishes.first.count).to eq(25)
    expect(buffet.sides.first.count).to eq(20)
    expect(buffet.desserts.first.count).to eq(8)
  end

  it 'loses hustle from the meter with each refill' do
    buffet = Buffet.new
    crew = BuffetStaff.new
  
    # Add dishes, sides, and desserts
    buffet.add_dish(BuffetDish.new('Cashew Chicken', portion_size: 'Heaping'))
    buffet.add_side(BuffetSide.new('Crab Rangoon', comfort_food: false))
    buffet.add_dessert(BuffetDessert.new('Jello Salad', classic_midwest: true))
  
    # Add customers to the line
    customer_1 = Customer.new('Joe')
    customer_2 = Customer.new('Jerrilyn')
    customer_3 = Customer.new('Daryl')
    customer_4 = Customer.new('Richey')
    customer_5 = Customer.new('Tim')
    customer_6 = Customer.new('Louann')
  
    buffet.increase_line(customer_1)
    buffet.increase_line(customer_2)
    buffet.increase_line(customer_3)
    buffet.increase_line(customer_4)
    buffet.increase_line(customer_5)
    buffet.increase_line(customer_6)
  
    # Serve customers
    buffet.serve
    # line should be empty after serving
    expect(buffet.serve).to eq("Time to refill the buffet")

    # Check the counts to ensure they're 0
    buffet.inspect
    buffet.inspect_sides
    buffet.inspect_desserts
  
    # Refill the buffet
    crew.refill_buffet(buffet)
  
    # Check hustle meter decrease
    expect(crew.check_hustle).to eq(8)
  end  
end
