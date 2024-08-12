class BuffetDessert
    attr_reader :name,
                :type,
                :classic_midwest,
                :count

    def initialize(name, classic_midwest: false)
        @name = name
        @type = 'dessert'
        @classic_midwest = classic_midwest
        @count = 18
    end

    def classic_midwest?
        @classic_midwest
    end

    def decrease_count
        @count -= 2
    end

    def refill_dessert
        @count += 18
    end

    def inspect
      "<Type: #{type}, Name: #{name}, Classic Midwest: #{classic_midwest}>"
    end
end
