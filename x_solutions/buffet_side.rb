class BuffetSide
  attr_reader :name,
              :comfort_food,
              :count

  def initialize(name, comfort_food: false)
      @name = name
      @comfort_food = comfort_food
      @count = 20
  end

  def comfort_food?
      @comfort_food
  end

  def decrease_side_count
      @count = @count - 5
  end

  def refill_side
      @count += 20
  end

  def inspect
    "<Name: #{name}, Comfort Food: #{comfort_food}>"
  end
end
