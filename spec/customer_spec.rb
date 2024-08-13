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

  xit 'has a plate' do
    customer = Customer.new('Barb')
    expect(customer.plate).to be_a(Hash)
  end

  xit 'has a plate with dishes, sides, and desserts' do
    customer = Customer.new('Merle')
    expect(customer.plate[:dishes]).to be_an(Array)
    expect(customer.plate[:sides]).to be_an(Array)
    expect(customer.plate[:desserts]).to be_an(Array)
  end

  xit 'can fill a customers plate with dishes, sides, and desserts' do
    customer = Customer.new('Scooter')

    customer.heap_a_helping(BuffetDish.new('Chicken Fingers', portion_size: 'Mound'))
    customer.divvy_up(BuffetSide.new('Baked Beans'))
    customer.sweeten_the_deal(BuffetDessert.new('Ice Cream'))

    expect(customer.plate[:dishes].count).to eq(1)
    expect(customer.plate[:sides].count).to eq(1)
    expect(customer.plate[:desserts].count).to eq(1)
  end

  xit 'decreases the foods count when it heaps a helping, divvys a side, and sweetens the deal ' do
    customer = Customer.new('Scooter')
    dish = BuffetDish.new('Chicken Fingers', portion_size: 'Mound')
    expect(dish.count).to eq(25)

    side = BuffetSide.new('Vegetable Medley')
    expect(side.count).to eq(20)

    dessert = BuffetDessert.new('Ice Cream')
    expect(dessert.count).to eq(18) 

    customer.heap_a_helping(dish)
    customer.divvy_up(side)
    customer.sweeten_the_deal(dessert)

    expect(dish.count).to eq(20)
    expect(side.count).to eq(15)
    expect(dessert.count).to eq(16)
  end

  xit 'knows if the plate has been drowned in Ranch' do
    customer = Customer.new('Barb')
    expect(customer.plate_drowned?).to be false
  end

  xit 'can say "Ohp! Let me scootch by ya for the Ranch..."' do
    customer = Customer.new('Barb')
    expect(customer.say_ohp).to eq('Ohp! Let me scootch by ya for the Ranch...')
  end

  xit 'drowns plate in Ranch if it says "Ohp!"' do
    customer = Customer.new('Barb')
    expect(customer.say_ohp).to eq('Ohp! Let me scootch by ya for the Ranch...')
    expect(customer.plate_drowned?).to be true
  end

  xit 'tracks the number of times it says \'Ohp\'' do
    customer = Customer.new('Barb')
    customer.say_ohp
    expect(customer.ohp_count).to eq(1)
  end
end
