class Multiplication
    attr_reader :multiplicand, :multiplier, :product

    def initialize(multiplicand, multiplier)
        @multiplicand = multiplicand
        @multiplier = multiplier
        @product = multiplicand * multiplier
    end
end