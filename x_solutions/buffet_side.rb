class BuffetSide
  attr_reader :name,
              :type,
              :comfort_food,
              :count

  def initialize(name, comfort_food: false)
      @name = name
      @type = 'side'
      @comfort_food = comfort_food
      @count = 20
  end

  def comfort_food?
      @comfort_food
  end

  def count?
      @count
  end

  def decrease_count
      @count -= 5
  end

  def refill_side
      @count += 20
  end

  def inspect
    "<Type: #{type}, Name: #{name}, Comfort Food: #{comfort_food}>"
  end
end
