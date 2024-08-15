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

  it 'tracks crew hustle level' do
    crew = BuffetStaff.new
    expect(crew.hustle_meter).to eq(10)
  end

  it 'refills empty dishes' do
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

    expect(buffet.line_report).to eq(6)

    buffet.serve
    expect(buffet.dishes.first.count).to eq(0)
    expect(buffet.sides.first.count).to eq(0)
    expect(buffet.desserts.first.count).to eq(8)
  end
end