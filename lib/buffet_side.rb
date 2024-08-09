class BuffetSide
    attr_reader :name, :comfort_food

    def initialize(name, comfort_food: false)
        @name = name
        @comfort_food = comfort_food
    end

    def comfort_food?
        @comfort_food
    end
end
