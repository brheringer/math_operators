class Division
    attr_reader :dividend, :divisor, :quotient, :remainder

    def initialize(dividend, divisor)
        @dividend = dividend
        @divisor = divisor
        @quotient = dividend / divisor
        @remainder = dividend % divisor
    end
end