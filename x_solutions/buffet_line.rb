class BuffetLine
    attr_reader :customers

    def initialize
        @customers = []
    end
    
    def add_customer(customer)
        @customers << customer
    end

    def remove_customer()
        @customers.shift
    end

    def last_in_line
        last_cust = @customers.pop
        return last_cust
    end

    def customer_count
        @customers.length
    end

    def inspect
        @customers.each do |cust|
            cust.inspect
        end
    end
end
