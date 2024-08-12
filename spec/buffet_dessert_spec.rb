require 'rspec'
require './lib/buffet_dessert'

RSpec.describe BuffetDessert do
  it 'has a name' do
    dessert = BuffetDessert.new('Fudge Brownies')

    expect(dessert.name).to eq('Fudge Brownies')
  end

  xit 'has a type \'dessert\' by default' do
      dessert = BuffetDessert.new('Blackberry Cobbler')

      expect(dessert.name).to eq('Blackberry Cobbler')
      expect(dessert.type).to eq('dessert')
  end

  xit 'can be a classic Midwest dessert' do
    dessert_1 = BuffetDessert.new('Banana Pudding', classic_midwest: true)
    dessert_2 = BuffetDessert.new('Assorted Cookies')
    dessert_3 = BuffetDessert.new('Blackberry Cobbler', classic_midwest: true)

    expect(dessert_1.name).to eq('Banana Pudding')
    expect(dessert_1.classic_midwest?).to be true

    expect(dessert_2.name).to eq('Assorted Cookies')
    expect(dessert_2.classic_midwest?).to be false

    expect(dessert_3.name).to eq('Blackberry Cobbler')
    expect(dessert_3.classic_midwest?).to be true
  end

  xit 'starts with a count of 18' do
    dessert = BuffetDessert.new('Assorted Cookies')
    expect(dessert.count).to eq(18)
  end
 
  xit 'can decrease the count' do
    dessert = BuffetDessert.new('Assorted Cookies')
    expect(dessert.count).to eq(18)

    dessert.decrease_count
    expect(dessert.count).to eq(16)
  end

  xit 'can run out of the dessert' do
    dessert = BuffetDessert.new('Assorted Cookies')
    expect(dessert.count).to eq(18)
    dessert.decrease_count
    dessert.decrease_count
    dessert.decrease_count
    dessert.decrease_count
    dessert.decrease_count
    dessert.decrease_count
    dessert.decrease_count
    dessert.decrease_count
    dessert.decrease_count
    expect(dessert.count).to eq(0)
  end

  xit 'can be refilled' do
    dessert = BuffetDessert.new('Assorted Cookies')
    expect(dessert.count).to eq(18)
    dessert.decrease_count
    dessert.decrease_count
    dessert.decrease_count
    dessert.decrease_count
    dessert.decrease_count
    dessert.decrease_count
    dessert.decrease_count
    dessert.decrease_count
    dessert.decrease_count
    expect(dessert.count).to eq(0)
    expect(dessert.refill_dessert).to eq(18)
  end
end
