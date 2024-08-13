class BuffetDish
    attr_reader :name,
                :portion_size,
                :count

    def initialize(name, portion_size: 'Heaping')
        @name = name
        @portion_size = portion_size
        @count = 25
    end

    def decrease_dish_count
        @count -= 5
    end

    def refill_dish
        @count += 25
    end

    def inspect
       "<Name: #{name}, Portion Size: #{portion_size}>"
    end
end
