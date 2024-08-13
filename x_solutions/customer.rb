class Customer
    attr_reader :name,
                :plate,
                :drowned_in_ranch,
                :ohp_count

    def initialize(name)
        @name = name
        @ohp_count = 0
        @plate = {
            dishes: [],
            sides: [],
            desserts: [],
            drowned_in_ranch: false,
        }
    end

    def inspect
        puts "<Name: #{name}, Plate: #{plate}, Ohp_Count: #{ohp_count}, Drowned In Ranch: #{plate[:drowned_in_ranch]}>"
    end

    def drown_plate_in_ranch
        @plate[:drowned_in_ranch] = true
    end

    def plate_drowned?
        @plate[:drowned_in_ranch]
    end

    def say_ohp
        @ohp_count += 1
        drown_plate_in_ranch
        return 'Ohp! Let me scootch by ya for the Ranch...'
    end

    def heap_a_helping(dish)
        if dish.count > 0
          @plate[:dishes] << { name: dish.name, portion_size: dish.portion_size }
          dish.decrease_dish_count
        else
            puts "Sorry, we're out of #{dish.name}."
        end
    end

    def divvy_up(side)
        if side.count > 0
            @plate[:sides] << { name: side.name, comfort_food: side.comfort_food }
            side.decrease_side_count
        else
            puts "Sorry, we're out of #{side.name}."
        end
    end

    def sweeten_the_deal(dessert)
        if dessert.count > 0
            @plate[:desserts] << { name: dessert.name, classic_midwest: dessert.classic_midwest }
            dessert.decrease_dessert_count
        else
            puts "Sorry, we're out of #{dessert.name}."
        end
    end
end
