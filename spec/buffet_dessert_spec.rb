require 'rspec'
require './lib/buffet_dessert'

RSpec.describe BuffetDessert do
  it 'has a name' do
    dessert = BuffetDessert.new('Apple Pie')

    expect(dessert.name).to eq('Apple Pie')
  end

  xit 'has a type \'dessert\' by default' do
      dessert = BuffetDessert.new('Blackberry Cobbler')

      expect(dessert.type).to eq('dessert')
  end

  it 'can be a classic Midwest dessert' do
    dessert_1 = BuffetDessert.new('Banana Pudding', classic_midwest: true)
    dessert_2 = BuffetDessert.new('Assorted Cookies')

    expect(dessert_1.name).to eq('Banana Pudding')
    expect(dessert_1.classic_midwest?).to be true

    expect(dessert_2.name).to eq('Assorted Cookies')
    expect(dessert_2.classic_midwest?).to be false
  end
end
