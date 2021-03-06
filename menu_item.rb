class MenuItem
    attr_reader :name
    attr_accessor :price
    #initialize with name and price attributes
    def initialize(name, price)
        @name = name
        @price = price
    end

    def to_s
        "#{@name}: $#{@price}"
    end
end