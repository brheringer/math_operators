class OperationsController < ApplicationController
    def index
    end

    def new
        check_params
        g = OperationsGenerator.new()
        g.quantity_of_each_operation = grant_string_to_number(params[:quantity_of_each_operation])
        g.min_digits = grant_string_to_number(params[:min_digits])
        g.max_digits = grant_string_to_number(params[:max_digits])
        g.fixed_digits_for_divisor = grant_string_to_number(params[:fixed_digits_for_divisor])
        g.fixed_digits_for_multiplier = grant_string_to_number(params[:fixed_digits_for_multiplier])
        g.seed = grant_string_to_number(params[:seed])
        g.addition = params[:addition]
        g.subtraction = params[:subtraction]
        g.multiplication = params[:multiplication]
        g.division = params[:division]
        g.generate
        @seed = g.seed
        @with_answers = params[:with_answers]
        @operations = g.generated_operations
    end

    private
    def check_params
        params.permit(:quantity_of_each_operation, :min_digits, :max_digits, :seed, 
            :with_answers, 
            :addition, 
            :subtraction, 
            :division, 
            :multiplication, 
            :fixed_digits_for_divisor,
            :fixed_digits_for_multiplier,
            :commit)
    end

    def grant_string_to_number(value)
        if value && value.to_i then value.to_i else value end
    end
end
