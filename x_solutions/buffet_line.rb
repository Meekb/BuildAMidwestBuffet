class BuffetLine
    attr_reader :line

    def initialize
        @line = {
            customers: [],
        }
    end

    def add_customer(customer)
        @line[:customers] << customer
    end

    def remove_customer(customer)
        @line[:customers].delete(customer)
    end

    def last_in_line
        @line[:customers].pop
    end

    def customer_count
        @line[:customers].length
    end

    def inspect
        @line[:customers].each do |cust|
            cust.inspect
        end
    end
end
