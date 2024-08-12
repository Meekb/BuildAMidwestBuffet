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

  it 'has a plate' do
    customer = Customer.new('Barb')
    expect(customer.plate).to be_a(Hash)
  end

  it 'has a plate with dishes, sides, and desserts' do
    customer = Customer.new('Merle')
    expect(customer.plate[:dishes]).to be_an(Array)
    expect(customer.plate[:sides]).to be_an(Array)
    expect(customer.plate[:desserts]).to be_an(Array)
  end

  it 'can fill their plate with dishes, sides, and desserts' do
    customer = Customer.new('Scooter')

    customer.add_dish(BuffetDish.new('Chicken Fingers', portion_size: 'Mound'))
    customer.add_side(BuffetSide.new('Baked Beans'))
    customer.add_dessert(BuffetDessert.new('Ice Cream'))

    expect(customer.plate[:dishes].count).to eq(1)
    expect(customer.plate[:sides].count).to eq(1)
    expect(customer.plate[:desserts].count).to eq(1)
 end

  it 'knows if the plate has been drowned in Ranch' do
    customer = Customer.new('Barb')
    expect(customer.plate_drowned?).to be false
  end

  it 'can drown the plate in Ranch' do
    customer = Customer.new('Barb')
    customer.drown_plate_in_ranch
    expect(customer.plate_drowned?).to be true
  end

  it 'can say "Ohp! Let me scootch by ya for the Ranch..."' do
    customer = Customer.new('Barb')
    expect(customer.say_ohp).to eq('Ohp! Let me scootch by ya for the Ranch...')
  end

  it 'drowns plate in Ranch if it says "Ohp!"' do
    customer = Customer.new('Barb')
    expect(customer.say_ohp).to eq('Ohp! Let me scootch by ya for the Ranch...')
    expect(customer.plate_drowned?).to be true
  end

  it 'tracks the number of times it says \'Ohp\'' do
    customer = Customer.new('Barb')
    customer.say_ohp
    expect(customer.ohp_count).to eq(1)
  end
end
