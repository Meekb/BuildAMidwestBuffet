require 'rspec'
require './lib/buffet'
require './lib/buffet_dish'
require './lib/buffet_side'
require './lib/buffet_dessert'
require './lib/customer'

RSpec.describe Buffet do
  it 'has a name' do
    buffet = Buffet.new
    expect(buffet.name).to eq('The Buffet Depot')
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

  xit 'has a line of customers' do
    buffet = Buffet.new(name: 'Bigo Buffet')
    expect(buffet.line).to be_a(Hash)
  end

  xit 'can add customers to the buffet line' do
      buffet = Buffet.new(name: 'Bigo Buffet')
      customer_1 = Customer.new('John')
      customer_2 = Customer.new('Jane')
      buffet.add_customer(customer_1)
      buffet.add_customer(customer_2)
      expect(buffet.line[:customers].count).to eq(2)
  end

  xit 'can report how many customers are in the buffet line' do
    buffet = Buffet.new(name: 'Bigo Buffet')
    buffet.add_dish(BuffetDish.new('Ribs', portion_size: 'Mound'))
    buffet.add_side(BuffetSide.new('Fried Okra'))
    buffet.add_dessert(BuffetDessert.new('Blackberry Cobbler', classic_midwest: true))
    customer_1 = Customer.new('LaDonna')
    buffet.add_customer(customer_1)
    customer_2 = Customer.new('Harold')
    buffet.add_customer(customer_2)
    expect(buffet.line_count).to eq(2)
  end

  xit 'says "There are no customers in the buffet line." if the line has no customers' do
    buffet = Buffet.new(name: 'Bigo Buffet')
    buffet.add_dish(BuffetDish.new('Ribs', portion_size: 'Mound'))
    buffet.add_side(BuffetSide.new('Fried Okra'))
    buffet.add_dessert(BuffetDessert.new('Blackberry Cobbler', classic_midwest: true))
    expect(buffet.line_count).to eq("There are no customers in the buffet line.")
  end

  xit 'can serve customers' do
     buffet = Buffet.new(name: 'Bigo Buffet')

     buffet.add_dish(BuffetDish.new('Ribs', portion_size: 'Mound'))
     buffet.add_dish(BuffetDish.new('Meatloaf', portion_size: 'Mound'))
     
     buffet.add_side(BuffetSide.new('Fried Okra'))
     buffet.add_side(BuffetSide.new('Southern Baked Mac & Cheese'))

     buffet.add_dessert(BuffetDessert.new('Blackberry Cobbler', classic_midwest: true))
     buffet.add_dessert(BuffetDessert.new('Peach Cobbler', classic_midwest: true))

     customer_1 = Customer.new('Karen')
     customer_2 = Customer.new('Rosco')
     buffet.add_customer(customer_1)
     buffet.add_customer(customer_2)
     buffet.serve(customer_1)

     expect(customer_1.plate[:dishes].first.name).to eq('Ribs')
     expect(customer_1.plate[:dishes].first.portion_size).to eq('Mound')
     expect(customer_1.plate[:sides].first.name).to eq('Fried Okra')
     expect(customer_1.plate[:sides].first.comfort_food?).to be false
     expect(customer_1.plate[:desserts].first.name).to eq('Blackberry Cobbler')
     expect(customer_1.plate[:desserts].first.classic_midwest?).to be true
     expect(customer_2.plate[:dishes]).to be_empty
  end

 xit 'removes the customer from the line after serving' do
    buffet = Buffet.new(name: 'Bigo Buffet')
    buffet.add_dish(BuffetDish.new('Ribs', portion_size: 'Mound'))
    buffet.add_dish(BuffetDish.new('Meatloaf', portion_size: 'Mound'))
    buffet.add_dish(BuffetDish.new('Chicken Fingers', portion_size:  "That'll do!"))
    buffet.add_dish(BuffetDish.new('Chicken & Dumplins', portion_size: 'Mound'))
     
    buffet.add_side(BuffetSide.new('Fried Okra'))
    buffet.add_side(BuffetSide.new('Southern Baked Mac & Cheese', comfort_food: true))
    buffet.add_side(BuffetSide.new('Coleslaw'))
    buffet.add_side(BuffetSide.new('Steamed Broccoli'))

    buffet.add_dessert(BuffetDessert.new('Blackberry Cobbler', classic_midwest: true))
    buffet.add_dessert(BuffetDessert.new('Peach Cobbler', classic_midwest: true))
    buffet.add_dessert(BuffetDessert.new('Assorted Cookies'))
    buffet.add_dessert(BuffetDessert.new('Ice Cream'))

    customer_1 = Customer.new('Jerrilyn')
    customer_2 = Customer.new('Daryl')
    customer_3 = Customer.new('Richey')
    buffet.add_customer(customer_1)
    buffet.add_customer(customer_2)
    buffet.add_customer(customer_3)
    expect(buffet.line[:customers].length).to eq(3)

    buffet.serve(customer_1)
    expect(buffet.line[:customers].length).to eq(2)

    buffet.serve(customer_2)
    expect(buffet.line[:customers].length).to eq(1)

    buffet.serve(customer_3)
    expect(buffet.line[:customers].length).to eq(0)
 end

 xit 'makes the last customer in the line say "Ohp! Let me scootch by ya for the Ranch..." if the line has 4 or more customers when customer gets served' do
      buffet = Buffet.new(name: 'Bigo Buffet')
      customer_1 = Customer.new('Markie')
      customer_2 = Customer.new('Junior')
      customer_3 = Customer.new('Cecil')
      customer_4 = Customer.new('Barb')
      customer_5 = Customer.new('Janet')

      buffet.add_dish(BuffetDish.new('Meatloaf', portion_size: 'Mound'))
      buffet.add_side(BuffetSide.new('Fried Okra'))
      buffet.add_dessert(BuffetDessert.new('Assorted Cookies'))

      buffet.add_customer(customer_1)
      buffet.add_customer(customer_2)
      buffet.add_customer(customer_3)
      buffet.add_customer(customer_4)
      buffet.add_customer(customer_5)

      buffet.serve(customer_1)
      expect(customer_5.ohp_count).to eq(1)
      # buffet.serve(customer_2)
      # expect(customer_5.ohp_count).to eq(2)
  end

  xit 'makes the customer who said "Ohp!" drown their plate in Ranch' do
    buffet = Buffet.new(name: 'Bigo Buffet')
    customer_1 = Customer.new('Markie')
    customer_2 = Customer.new('Junior')
    customer_3 = Customer.new('Cecil')
    customer_4 = Customer.new('Barb')
    customer_5 = Customer.new('Janet')

    buffet.add_customer(customer_1)
    buffet.add_customer(customer_2)
    buffet.add_customer(customer_3)
    buffet.add_customer(customer_4)
    buffet.add_customer(customer_5)

    buffet.serve(customer_1)
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
    buffet.add_customer(customer_1)
    buffet.add_customer(customer_2)
    buffet.add_customer(customer_3)
    buffet.add_customer(customer_4)
    buffet.add_customer(customer_5)
    buffet.add_customer(customer_6)
    expect(buffet.line[:customers].length).to eq(6)

    buffet.serve(customer_1)
    expect(customer_6.ohp_count).to eq(1)
    expect(buffet.line[:customers].length).to eq(4)

    buffet.serve(customer_2)
    expect(customer_5.ohp_count).to eq(1)
    expect(buffet.line[:customers].length).to eq(2)
 end
end
