class Buffet
    attr_reader :name,
                :dishes,
                :sides,
                :desserts,
                :line

    def initialize(name: 'The Buffet Depot')
        @name = name
        @dishes = []
        @sides = []
        @desserts = []
        @line = {
            customers: [],
        }
    end

    def add_customer(customer)
        @line[:customers] << customer
    end

    def add_dish(dish)
        @dishes << dish
        @dishes.each do |dish|
            puts dish.inspect
        end
    end

    def add_side(side)
        @sides << side
        @sides.each do |side|
            puts side.inspect
        end
    end

    def add_dessert(dessert)
        @desserts << dessert
        @desserts.each do |dessert|
            puts dessert.inspect
        end
    end

    def serve(customer)
        if @line[:customers].length > 4
            last_in_line = @line[:customers].last
            last_in_line.say_ohp
        end
        customer.add_dish(@dishes.shift)
        customer.add_side(@sides.shift)
        customer.add_dessert(@desserts.shift)
        @line[:customers].delete(customer)
    end
end
