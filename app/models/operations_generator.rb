class OperationsGenerator
    attr_accessor :quantity_of_each_operation, :min_digits, :max_digits, :fixed_digits_for_divisor, :fixed_digits_for_multiplier, :seed
    attr_accessor :addition, :subtraction, :multiplication, :division
    attr_reader :generated_operations

    def initialize
        @generated_operations = []
    end

    def generate
        clear
        initialize_numbers_generators
        @quantity_of_each_operation.times do
            @generated_operations.push generate_addition if @addition
            @generated_operations.push generate_subtraction if @subtraction
            @generated_operations.push generate_multiplication if @multiplication
            @generated_operations.push generate_division if @division
        end
    end

    def clear
        @generated_operations.clear
    end

    private
    def initialize_numbers_generators
        @number_generator = NumberGenerator.new(@min_digits, @max_digits, @seed)
        @divisor_generator = @fixed_digits_for_divisor && @fixed_digits_for_divisor > 0 ?
            NumberGenerator.new(@fixed_digits_for_divisor, @fixed_digits_for_divisor, @seed) :
            @number_generator
        @multiplier_generator = @fixed_digits_for_multiplier && @fixed_digits_for_multiplier > 0 ?
            NumberGenerator.new(@fixed_digits_for_multiplier, @fixed_digits_for_multiplier, @seed) :
            @number_generator
    end

    def generate_addition
        n = generate_two_numbers
        Addition.new(n.max, n.min)
    end

    def generate_subtraction
        n = generate_two_numbers
        Subtraction.new(n.max, n.min)
    end

    def generate_multiplication
        n = []
        n.push @multiplier_generator.generate
        n.push @number_generator.generate
        Multiplication.new(n.max, n.min)
    end

    def generate_division
        n = []
        n.push @divisor_generator.generate
        n.push @number_generator.generate
        Division.new(n.max, n.min)
    end

    def generate_two_numbers
        n = [@number_generator.generate, @number_generator.generate]
        n.sort
    end
end