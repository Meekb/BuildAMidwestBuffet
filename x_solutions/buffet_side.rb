class BuffetSide
  attr_reader :name,
              :type,
              :comfort_food

  def initialize(name, comfort_food: false)
      @name = name
      @type = 'side'
      @comfort_food = comfort_food
  end

  def comfort_food?
      @comfort_food
  end

  def inspect
    "<Type: #{type}, Name: #{name}, Comfort Food: #{comfort_food}>"
  end
end
