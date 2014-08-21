require 'spec_helper'

module ToySimulator
  describe Coordinate do
    
    let(:zero) {Coordinate.new(x_axis: 0, y_axis: 0)}
    let(:one_one) {Coordinate.new(x_axis: 1, y_axis: 1)}

    describe '#add' do
      it 'creates a new Coordinate' do
        expect(zero.add(zero)).to_not equal zero
      end

      it 'adds x_axis and y_axis of two coordinates respectively' do
        result = zero.add(one_one)
        expect(result.x_axis).to eq 1
        expect(result.y_axis).to eq 1
      end
    end

    describe '#to_h' do
      it 'returns hash describing this coordinate' do
        expect(Coordinate.new(y_axis: -10, x_axis: 20).to_h).to eq({x_axis: 20, y_axis: -10})
      end
    end

    describe '#==' do
      it 'compares coordinates by values' do
        expect(zero).to eq Coordinate.new(x_axis: 0, y_axis: 0)
      end
    end

    describe '#<=' do
      it 'compares coordinates by values' do
        expect(zero <= one_one).to be true
        expect(zero <= Coordinate.new(x_axis: -1, y_axis: 0)).to be false
      end
    end

    describe '#>=' do
      it 'compares coordinates by values' do
        expect(zero >= one_one).to be false
        expect(one_one >= zero).to be true
      end
    end
  end 
end