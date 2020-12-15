require 'rails_helper'

describe OperationsGenerator do
    subject {
        g = OperationsGenerator.new()
        g.quantity_of_each_operation = 1
        g.min_digits = 3
        g.max_digits = 3
        g.seed = nil
        g.addition = false
        g.subtraction = false
        g.multiplication = false
        g.division = false
        g
    }

    it 'should generate 1 operation of each' do
        subject.addition = true
        subject.subtraction = true
        subject.multiplication = true
        subject.division = true
        subject.generate
        op = subject.generated_operations

        expect(op.length).to eq 4
    end

    it 'should respect fixed digits for divisor' do
        subject.fixed_digits_for_divisor = 2
        subject.division = true
        subject.generate
        op = subject.generated_operations

        expect(op.length).to eq 1
        expect(op[0].dividend).to be_between(100, 999).inclusive
        expect(op[0].divisor).to be_between(10, 99).inclusive
    end

    it 'should respect fixed digits for multiplier' do
        subject.fixed_digits_for_multiplier = 1
        subject.multiplication = true
        subject.generate
        op = subject.generated_operations

        expect(op.length).to eq 1
        expect(op[0].multiplicand).to be_between(100, 999).inclusive
        expect(op[0].multiplier).to be_between(1, 9).inclusive
    end

    it 'should generate divisor <= dividend' do
        subject.division = true
        50.times do #ok, it could give a false positive, but... come on
            subject.generate
            op = subject.generated_operations

            expect(op.length).to eq 1
            expect(op[0].dividend >= op[0].divisor).to be true
        end
    end
end