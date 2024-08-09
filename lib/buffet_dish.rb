class BuffetDish
    attr_reader :name, :portion_size

    def initialize(name, portion_size)
        @name = name
        @portion_size = portion_size
    end
end
