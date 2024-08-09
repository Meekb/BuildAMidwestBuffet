class BuffetDessert
    attr_reader :name

    def initialize(name, classic_midwest: false)
        @name = name
        @classic_midwest = classic_midwest
    end

    def classic_midwest?
        @classic_midwest
    end
end
