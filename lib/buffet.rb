class Buffet
    attr_reader :dishes, :sides, :desserts

    def initialize
        @dishes = []
        @sides = []
        @desserts = []
    end

    def add_dish(dish)
        @dishes << dish
    end

    def add_side(side)
        @sides << side
    end

    def add_dessert(dessert)
        @desserts << dessert
    end
end
