class Customer
    attr_reader :name
    attr_accessor :plate

    def initialize(name)
        @name = name
        @plate = set_plate
    end

    def set_plate
        {
          dishes: [],
          sides: [],
          desserts: [],
        }
    end

    def say_ohp
        return 'Ohp! Let me scootch by ya for the Ranch...'
    end

    def add_dish(dish)
        @plate[:dishes] << dish
    end

    def add_side(side)
        @plate[:sides] << side
    end

    def add_dessert(dessert)
        @plate[:desserts] << dessert
    end
end
