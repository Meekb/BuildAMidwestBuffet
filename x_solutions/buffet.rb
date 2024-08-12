class Buffet
    attr_reader :name,
                :dishes,
                :sides,
                :desserts,
                :buffet_line

    def initialize(name: 'The Buffet Depot')
        @name = name
        @dishes = []
        @sides = []
        @desserts = []
        @buffet_line = BuffetLine.new
    end

    def increase_line(customer)
        @buffet_line.add_customer(customer)
    end

    def decrease_line(customer)
        @buffet_line.remove_customer(customer)
    end

    def line_report
        return "No wait time at the buffet, folks!" if @buffet_line.customer_count == 0
        @buffet_line.customer_count
    end

    def add_dish(dish)
        @dishes << dish
        # @dishes.each do |dish|
        #     puts dish.inspect
        # end
    end

    def add_side(side)
        @sides << side
        # @sides.each do |side|
        #     puts side.inspect
        # end
    end

    def add_dessert(dessert)
        @desserts << dessert
        # @desserts.each do |dessert|
        #     puts dessert.inspect
        # end
    end

    def serve(cust)
        if line_report >= 4
            last_in_line = @buffet_line.last_in_line
            puts "LAST: #{last_in_line}"
            last_in_line.say_ohp
            last_in_line.drown_plate_in_ranch
        end
        cust.add_dish(@dishes.shift)
        cust.add_side(@sides.shift)
        cust.add_dessert(@desserts.shift)
        decrease_line(cust)
        @buffet_line.inspect
    end
end
