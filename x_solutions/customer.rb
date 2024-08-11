class Customer
    attr_reader :name,
                :plate,
                :ohp_count
                :plate_drowned_in_ranch

    def initialize(name)
        @name = name
        @plate = {
            dishes: [],
            sides: [],
            desserts: [],
            plate_drowned_in_ranch: false,
        }
        @ohp_count = 0
    end

    def drown_plate_in_ranch(val)
        @plate_drowned_in_ranch = val
    end

    def plate_drowned?
        @plate_drowned_in_ranch
    end

    def say_ohp
        @ohp_count += 1
        drown_plate_in_ranch
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
