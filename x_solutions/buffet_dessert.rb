class BuffetDessert
    attr_reader :name,
                :classic_midwest,
                :count

    def initialize(name, classic_midwest: false)
        @name = name
        @classic_midwest = classic_midwest
        @count = 18
    end

    def classic_midwest?
        @classic_midwest
    end

    def decrease_dessert_count
        @count -= 2
    end

    def inspect
      "<Name: #{name}, Classic Midwest: #{classic_midwest}>"
    end
end
