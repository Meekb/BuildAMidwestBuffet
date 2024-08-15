require 'rspec'
require './lib/buffet'
require './lib/buffet_dish'
require './lib/buffet_line'
require './lib/buffet_side'
require './lib/buffet_staff'
require './lib/buffet_dessert'
require './lib/customer'

RSpec.describe Buffet do
  it 'has a name' do
    buffet = Buffet.new
    expect(buffet.name).to eq('The Buffet Depot')
  end

  it 'has a team of 25 to work the buffet' do
    buffet = Buffet.new
    expect(buffet.team).to be_an_instance_of(BuffetStaff)
    expect(buffet.team.crew_count).to eq(25)
  end

  xit 'can have a different name' do
      buffet = Buffet.new(name: 'Golden Corral')
      expect(buffet.name).to eq('Golden Corral')
  end

  xit 'can have a lot of dishes' do
    buffet = Buffet.new(name: 'Bigo Buffet')
    buffet.add_dish(BuffetDish.new('Meatloaf', portion_size: 'Heaping'))
    buffet.add_dish(BuffetDish.new('Pulled Pork', portion_size: 'Mound'))
    buffet.add_dish(BuffetDish.new('Chicken Fingers', portion_size: 'That\'ll do!'))
    expect(buffet.dishes.count).to eq(3)
    expect(buffet.dishes[2].portion_size).to eq('That\'ll do!')
    expect(buffet.dishes[1].portion_size).to eq('Mound')
    expect(buffet.dishes[0].portion_size).to eq('Heaping')
  end

  xit 'can have many sides' do
    buffet = Buffet.new(name: 'Bigo Buffet')
    buffet.add_side(BuffetSide.new('Southern Bakes Mac & Cheese', comfort_food: true))
    buffet.add_side(BuffetSide.new('Coleslaw'))

    expect(buffet.sides.count).to eq(2)
    expect(buffet.sides[0].comfort_food?).to be true
    expect(buffet.sides[1].comfort_food?).to be false
  end

  xit 'can have a wide array of desserts' do
    buffet = Buffet.new(name: 'Bigo Buffet')
    buffet.add_dessert(BuffetDessert.new('Ambrosia Fluff', classic_midwest: true))
    buffet.add_dessert(BuffetDessert.new('Chocolate Pudding'))
    buffet.add_dessert(BuffetDessert.new('Sweet Potato Pie', classic_midwest: true))
    buffet.add_dessert(BuffetDessert.new('Frozen Concrete', classic_midwest: true))
    buffet.add_dessert(BuffetDessert.new('Assorted Cookies'))
    expect(buffet.desserts[0].classic_midwest?).to be true
    expect(buffet.desserts.count).to eq(5)
    expect(buffet.desserts[1].classic_midwest?).to be false
  end

  xit 'has a buffet line' do
    buffet = Buffet.new(name: 'Bigo Buffet')
    expect(buffet.buffet_line).to be_an_instance_of(BuffetLine)
  end

  xit 'reports the number of customers in line' do
    buffet = Buffet.new(name: 'Bigo Buffet')
    customer_1 = Customer.new('Tammy')
    customer_2 = Customer.new('Carl')

    buffet.buffet_line.add_customer(customer_1)
    buffet.buffet_line.add_customer(customer_2)
    expect(buffet.line_report).to eq(2)

    buffet.buffet_line.remove_customer()
    buffet.buffet_line.remove_customer()
    expect(buffet.line_report).to eq("No wait time at the buffet, folks!")
  end

  xit 'can increase and decrease the number of customers in the buffet line' do
    buffet = Buffet.new(name: 'Bigo Buffet')
    customer_1 = Customer.new('Tammy')
    customer_2 = Customer.new('Carl')

    buffet.increase_line(customer_1)
    buffet.increase_line(customer_2)
    expect(buffet.line_report).to eq(2)

    buffet.decrease_line()
    buffet.decrease_line()
    expect(buffet.line_report).to eq("No wait time at the buffet, folks!")
  end

  xit 'serves all the customers that are in the buffet line' do
     buffet = Buffet.new(name: 'Bigo Buffet')

     buffet.add_dish(BuffetDish.new('Ribs', portion_size: 'Mound'))
     buffet.add_side(BuffetSide.new('Southern Baked Mac & Cheese', comfort_food: true))
     buffet.add_dessert(BuffetDessert.new('Peach Cobbler', classic_midwest: true))

     customer_1 = Customer.new('Karen')
     customer_2 = Customer.new('Rosco')

     buffet.increase_line(customer_1)
     buffet.increase_line(customer_2)
     expect(buffet.buffet_line.customers.count).to eq(2) 
     expect(customer_1.plate[:dishes]).to be_empty
     expect(customer_2.plate[:dishes]).to be_empty
     
     buffet.serve()

     expect(customer_1.plate[:dishes].length).to eq(1)
     expect(customer_2.plate[:dishes].first[:name]).to eq('Ribs')
     expect(customer_1.plate[:sides].first[:name]).to eq('Southern Baked Mac & Cheese')
     expect(customer_2.plate[:desserts].first[:name]).to eq('Peach Cobbler')
     expect(customer_1.plate[:desserts].first[:classic_midwest]).to be true
  end

 xit 'removes the customer from the buffet line after serving them' do
    buffet = Buffet.new(name: 'Bigo Buffet')
    buffet.add_dish(BuffetDish.new('Chicken Fingers', portion_size:  "That'll do!"))
    buffet.add_side(BuffetSide.new('Southern Baked Mac & Cheese', comfort_food: true))
    buffet.add_dessert(BuffetDessert.new('Assorted Cookies'))

    customer_1 = Customer.new('Jerrilyn')
    customer_2 = Customer.new('Daryl')
    customer_3 = Customer.new('Richey')
    buffet.increase_line(customer_1)
    buffet.increase_line(customer_2)
    buffet.increase_line(customer_3)
    expect(buffet.line_report).to eq(3)

    buffet.serve()
    expect(buffet.line_report).to eq("No wait time at the buffet, folks!")
 end

 xit 'makes the last customer in the line say "Ohp! Let me scootch by ya for the Ranch..." if the line has 4 or more customers when a customer gets served' do
      buffet = Buffet.new(name: 'Bigo Buffet')
      customer_1 = Customer.new('Markie')
      customer_2 = Customer.new('Junior')
      customer_3 = Customer.new('Cecil')
      customer_4 = Customer.new('Barb')
      customer_5 = Customer.new('Janet')

      buffet.add_dish(BuffetDish.new('Meatloaf', portion_size: 'Mound'))
      buffet.add_side(BuffetSide.new('Fried Okra'))
      buffet.add_dessert(BuffetDessert.new('Assorted Cookies'))

      buffet.increase_line(customer_1)
      buffet.increase_line(customer_2)
      buffet.increase_line(customer_3)
      buffet.increase_line(customer_4)
      buffet.increase_line(customer_5)

      buffet.serve()
      expect(customer_5.ohp_count).to eq(1)
  end

  xit 'makes the customer who said "Ohp!" drown their plate in Ranch' do
    buffet = Buffet.new(name: 'Bigo Buffet')
    customer_1 = Customer.new('Markie')
    customer_2 = Customer.new('Junior')
    customer_3 = Customer.new('Cecil')
    customer_4 = Customer.new('Barb')
    customer_5 = Customer.new('Janet')

    buffet.increase_line(customer_1)
    buffet.increase_line(customer_2)
    buffet.increase_line(customer_3)
    buffet.increase_line(customer_4)
    buffet.increase_line(customer_5)

    buffet.add_dish(BuffetDish.new('Meatloaf', portion_size: 'Mound'))
    buffet.add_side(BuffetSide.new('Fried Okra'))
    buffet.add_dessert(BuffetDessert.new('Assorted Cookies'))

    buffet.serve()
    expect(customer_5.ohp_count).to eq(1)
    expect(customer_5.plate_drowned?).to be true
  end

  xit 'removes the customer from the line when they drown their plate in ranch' do
    buffet = Buffet.new(name: 'Bigo Buffet')
    buffet.add_dish(BuffetDish.new('Ribs', portion_size: 'Mound'))
    buffet.add_side(BuffetSide.new('Fried Okra'))
    buffet.add_dessert(BuffetDessert.new('Blackberry Cobbler', classic_midwest: true))

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

    buffet.serve()
    expect(customer_6.ohp_count).to eq(1)
    expect(customer_5.ohp_count).to eq(1)
  end
end
