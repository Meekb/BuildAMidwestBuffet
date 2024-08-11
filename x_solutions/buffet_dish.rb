class BuffetDish
    attr_reader :name,
                :type,
                :portion_size

    def initialize(name, portion_size: 'Heaping')
        @name = name
        @type = 'main'
        @portion_size = portion_size
    end

    def inspect
       "<Type: #{type}, Name: #{name}, Portion Size: #{portion_size}>"
    end
end
