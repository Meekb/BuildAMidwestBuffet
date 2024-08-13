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

    def inspect_dishes
        @dishes.each do |dish|
            puts "Name: #{dish.name}, Count: #{dish.count}"
        end
    end

    def increase_line(customer)
        @buffet_line.add_customer(customer)
    end

    def decrease_line()
        @buffet_line.remove_customer
    end

    def line_report
        return "No wait time at the buffet, folks!" if @buffet_line.customer_count == 0
        @buffet_line.customer_count
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

    def serve()
        while @buffet_line.customers.any?
            if line_report >= 4
                last_in_line = @buffet_line.last_in_line
                last_in_line.say_ohp
                # inspection for final tests
                last_in_line.inspect
            end
            cust = @buffet_line.customers.shift
            cust.heap_a_helping(@dishes.first)
            cust.divvy_up(@sides.first)
            cust.sweeten_the_deal(@desserts.first)
        end
    end
    
end
