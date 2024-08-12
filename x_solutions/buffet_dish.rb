class BuffetDish
    attr_reader :name,
                :type,
                :portion_size,
                :count

    def initialize(name, portion_size: 'Heaping')
        @name = name
        @type = 'main'
        @portion_size = portion_size
        @count = 25
    end

    def decrease_count
        @count -= 5
    end

    def refill_dish
        @count += 25
    end

    def inspect
       "<Type: #{type}, Name: #{name}, Portion Size: #{portion_size}>"
    end
end
