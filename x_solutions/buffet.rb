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

    def line_count
        return 'There are no customers in the buffet line.' if @line[:customers].empty?
        @line[:customers].length
    end

    def inspect
        @line[:customers].each do |cust|
            cust.inspect
        end
    end

    def serve(cust)
        if @line[:customers].length >= 4
            last_in_line = @line[:customers].last
            last_in_line.say_ohp
            last_in_line.drown_plate_in_ranch
            @line[:customers].delete(last_in_line)
        end
        cust.add_dish(@dishes.shift)
        cust.add_side(@sides.shift)
        cust.add_dessert(@desserts.shift)
        @line[:customers].delete(cust)
        inspect
    end
end
