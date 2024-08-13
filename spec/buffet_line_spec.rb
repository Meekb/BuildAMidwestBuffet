require 'rspec'
require './lib/buffet'
require './lib/buffet_dish'
require './lib/buffet_line'
require './lib/buffet_side'
require './lib/buffet_dessert'
require './lib/customer'

RSpec.describe BuffetLine do
  it 'keeps track of customers in the line' do
    buffet_line = BuffetLine.new
    expect(buffet_line.customers).to be_an(Array)
  end

  xit 'can add customers' do
    buffet_line = BuffetLine.new
    customer_1 = Customer.new('Rita')
    customer_2 = Customer.new('Toni')
    buffet_line.add_customer(customer_1)
    expect(buffet_line.customers.length).to eq(1)
    buffet_line.add_customer(customer_2)
    expect(buffet_line.customers.length).to eq(2)
  end

  xit 'can remove customers' do
      buffet_line = BuffetLine.new
      customer_1 = Customer.new('Fred')
      buffet_line.add_customer(customer_1)
      customer_2 = Customer.new('Candi')
      buffet_line.add_customer(customer_2)
      expect(buffet_line.customers.length).to eq(2)
      buffet_line.remove_customer()
      expect(buffet_line.customers.length).to eq(1)
      buffet_line.remove_customer()
      expect(buffet_line.customers.length).to eq(0)
  end

  xit 'can tell how many customers are in the line' do
      buffet_line = BuffetLine.new
      customer_1 = Customer.new('LaDonna')
      buffet_line.add_customer(customer_1)
      customer_2 = Customer.new('Harold')
      buffet_line.add_customer(customer_2)
      customer_3 = Customer.new('Brandi')
      buffet_line.add_customer(customer_3)
      expect(buffet_line.customer_count).to eq(3)
  end

end
