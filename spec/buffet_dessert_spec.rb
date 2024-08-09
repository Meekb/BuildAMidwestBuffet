require 'rspec'
require './lib/buffet_dessert'

RSpec.describe BuffetDessert do
  it 'has a name' do
    dessert = BuffetDessert.new('Apple Pie')
    expect(dessert.name).to eq('Apple Pie')
  end

  it 'can be a classic Midwest dessert' do
    dessert = BuffetDessert.new('Banana Pudding', classic_midwest: true)
    expect(dessert.classic_midwest?).to be true
  end
end
