class Subtraction
    attr_reader :minuendo, :subtrahend, :difference

    def initialize(minuendo, subtrahend)
        @minuendo = minuendo
        @subtrahend = subtrahend
        @difference = minuendo - subtrahend
    end
end