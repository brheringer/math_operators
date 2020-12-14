class NumberGenerator
    def initialize(minDigits, maxDigits, seed)
        @min = 10 ** (minDigits - 1)
        @max = 10 ** (maxDigits) - 1
        if seed.is_a?(Numeric) and seed > 0
            @r = Random.new(seed)
        else
            @r = Random.new
        end
    end

    def generate
        @r.rand(@min..@max)
    end
end