class BuffetStaff
  attr_reader :crew_count,
              :hustle_meter

  def initialize
    @crew_count = 25
    @hustle_meter = 10
  end

  def check_hustle
    @hustle_meter
  end

  def decrease_hustle
    @hustle_meter -= 1
  end

  def refill_buffet(buffet)
    puts "Refilling the buffet!"
    buffet.dishes.each do |dish|
      if dish.count <= 0
        dish.refill_dish
        decrease_hustle
        puts "Decreased hustle after refilling dish: #{@hustle_meter}"
      else
        puts "Dish count is not <= 0; hustle_meter remains at #{@hustle_meter}"
      end
    end
  
    buffet.sides.each do |side|
      if side.count <= 0
        side.refill_side
        decrease_hustle
        puts "Decreased hustle after refilling side: #{@hustle_meter}"
      else
        puts "Side count is not <= 0; hustle_meter remains at #{@hustle_meter}"
      end
    end
  
    buffet.desserts.each do |dessert|
      if dessert.count <= 0
        dessert.refill_dessert
        decrease_hustle
        puts "Decreased hustle after refilling dessert: #{@hustle_meter}"
      else
        puts "Dessert count is not <= 0; hustle_meter remains at #{@hustle_meter}"
      end
    end
  end

end