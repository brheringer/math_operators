require 'rails_helper'

describe Division do
    it 'should represent 10 / 2 = 5, remainds 0' do
        buildOperateAndCheck(10, 2, 5, 0)
    end

    it 'should represent 11 / 2 = 5, remainds 1' do
        buildOperateAndCheck(11, 2, 5, 1)
    end

    it 'should represent 11.0 / 2.0 = 5.5, remainds 1 anyways' do
        buildOperateAndCheck(11.0, 2.0, 5.5, 1)
    end

    def buildOperateAndCheck(dividend, divisor, expectedQuotient, expectedRemainder)
        division = Division.new(dividend, divisor)
        expect(division.dividend).to eq dividend
        expect(division.divisor).to eq divisor
        expect(division.quotient).to eq expectedQuotient
        expect(division.remainder).to eq expectedRemainder
    end

    it 'should raise error when trying to divide by zero' do
        expect { Division.new(0, 0) }.to raise_error(ZeroDivisionError)
    end

    it 'should raise error with non numeric parameters' do
        expect { Division.new('0', '0') }.to raise_error(NoMethodError)
        expect { Division.new(nil, nil) }.to raise_error(NoMethodError)
    end
end

#TODO negative numbers