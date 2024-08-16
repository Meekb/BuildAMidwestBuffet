class Buffet
    attr_reader :name,
                :dishes,
                :sides,
                :desserts,
                :buffet_line,
                :team

    def initialize(name: 'Bigo Buffet')
        @name = name
        @team = BuffetStaff.new
        @dishes = []
        @sides = []
        @desserts = []
        @buffet_line = BuffetLine.new
    end

    def increase_line(customer)
        @buffet_line.add_customer(customer)
    end

    def decrease_line()
        @buffet_line.remove_customer
    end

    def line_report
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

    def serve
        # refill the buffet or last_in_line says ohp
        if line_report == 0
           return  "Time to refill the buffet"
        elsif line_report >= 4
            last_in_line = @buffet_line.last_in_line
            last_in_line.say_ohp
        end
        while @buffet_line.customers.any?
            # next customer getting served
            next_cust = @buffet_line.customers.shift
            
            # next dish / side / dessert to serve customer
            dish_to_serve = @dishes.max_by { |dish| dish.count }
            side_to_serve = @sides.max_by { |side| side.count }
            dessert_to_serve = @desserts.max_by { |dessert| dessert.count }
            
            # customer heaps helping, divvys up side, sweetens the deal
            next_cust.heap_a_helping(dish_to_serve)
            next_cust.divvy_up(@sides.first)
            next_cust.sweeten_the_deal(@desserts.first)
        end
        
    end

    # Debug
    def inspect_dishes
        @dishes.each do |dish|
            puts "Name: #{dish.name}, Count: #{dish.count}"
        end
    end

    def inspect_sides
        @dishes.each do |side|
            puts "Name: #{side.name}, Count: #{side.count}"
        end
    end

    def inspect_desserts
        @desserts.each do |dessert|
            puts "Name: #{dessert.name}, Count: #{desserts.count}"
        end
    end
    
end
