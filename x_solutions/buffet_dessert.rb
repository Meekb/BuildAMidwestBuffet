class BuffetDessert
    attr_reader :name,
                :type,
                :classic_midwest

    def initialize(name, classic_midwest: false)
        @name = name
        @type = 'dessert'
        @classic_midwest = classic_midwest
    end

    def classic_midwest?
        @classic_midwest
    end

    def inspect
      "<Type: #{type}, Name: #{name}, Classic Midwest: #{classic_midwest}>"
    end
end
