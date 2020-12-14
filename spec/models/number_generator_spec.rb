require 'rails_helper'

describe NumberGenerator do
    it 'should generate a random number with 3 digits' do
        50.times do
            n = NumberGenerator.new(3, 3, nil).generate()
            expect(n).to be >= 100
            expect(n).to be <= 999
        end
    end

    it 'should generate a random number with 1 digit' do
        50.times do
            n = NumberGenerator.new(1, 1, nil).generate()
            expect(n).to be >= 0
            expect(n).to be <= 9
        end
    end

    it 'should generate a random number with 2-3 digits' do
        50.times do
            n = NumberGenerator.new(2, 3, nil).generate()
            expect(n).to be >= 10
            expect(n).to be <= 999
        end
    end
end

#TODO can't: min > max
#TODO can't: min < 1