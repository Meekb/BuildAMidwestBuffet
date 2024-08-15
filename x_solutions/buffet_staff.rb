class BuffetStaff
  attr_reader :crew_count,
              :hustle_meter

  def initialize
    @crew_count = 25
    @hustle_meter = 10
  end

  def refill_buffet(buffet)
    puts "Refilling the buffet!"
    buffet[:dishes].each do |dish|
        next unless dish.count <= 0
        dish.refill_dish
    end

    buffet[:sides].each do |side|
        next unless side.count <= 0
        side.refill_side
    end

    buffet[:desserts].each do |dessert|
        next unless dessert.count <= 0
        dessert.refill_dessert
    end
  end

end