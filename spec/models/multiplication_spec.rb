require 'rails_helper'

describe Multiplication do
    it 'should represent 5 * 2 = 10' do
        buildOperateAndCheck(5, 2, 10)
    end

    it 'should represent 5.5 * 2.0 = 11' do
        buildOperateAndCheck(5.5, 2.0, 11)
    end

    def buildOperateAndCheck(multiplicand, multiplier, expectedProduct)
        multiplication = Multiplication.new(multiplicand, multiplier)
        expect(multiplication.multiplicand).to eq multiplicand
        expect(multiplication.multiplier).to eq multiplier
        expect(multiplication.product).to eq expectedProduct
    end

    it 'should raise error with non numeric parameters' do
        expect { Multiplication.new('0', '0') }.to raise_error(TypeError)
        expect { Multiplication.new(nil, nil) }.to raise_error(NoMethodError)
    end
end

#TODO negative numbers