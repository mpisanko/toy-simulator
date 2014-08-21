require 'spec_helper'

module ToySimulator
  describe Position do
    
    let(:one_zero_east) {Position.new(facing: :east, x_axis: 1, y_axis: 0)}

    describe '#==' do
      let(:other_1_0_east) {Position.new(facing: :east, x_axis: 1, y_axis: 0)}
      it 'checks equality by value' do
        expect(one_zero_east).to eq other_1_0_east
      end
    end

    describe '#to_h' do
      it 'returns a hash describing position\'s bearing and coordinates' do
        expect(one_zero_east.to_h).to eq({facing: :east, coordinate: {x_axis: 1, y_axis: 0}})
      end
    end

    describe '#left' do
      it 'returns new position with facing changed left' do
        expect(one_zero_east.left).to eq(Position.new(x_axis: 1, y_axis: 0, facing: :north))
      end
    end
    
    describe '#right' do
      it 'returns new position with facing changed right' do
        expect(one_zero_east.right).to eq(Position.new(x_axis: 1, y_axis: 0, facing: :south))
      end
    end

    describe '#forward' do
      it 'returns new position facing same direction, advanced forward' do
        expect(one_zero_east.forward).to eq(Position.new(x_axis: 2, y_axis: 0, facing: :east))
      end
    end

    describe '#within_bounds' do
      let(:boundary) {Coordinate.new(x_axis: 5, y_axis: 5)}
      let(:x) {-1}
      let(:y) {0}
      let(:position) {Position.new(facing: :south, x_axis: x, y_axis: y)}

      context 'when passed only (upper) boundary' do
        it 'returns true when greater than zero and less than upper bound' do
          expect(one_zero_east.within_bounds(boundary)).to be true
        end

        it 'returns false when less than zero' do
          boundary = Coordinate.new(x_axis: 1, y_axis: 0)
          expect(position.within_bounds(boundary)).to be false
        end
      end

      context 'when passed both bounds' do
        let(:lower_bound) {Coordinate.new(x_axis: -5, y_axis: -5)}

        context 'and falls between the two' do
          let(:x) {-5}
          let(:y) {-4}
          
          it 'returns true' do
            expect(position.within_bounds(boundary, lower_bound: lower_bound)).to be true
          end
        end

        context 'and outside bounds' do
          let(:x) {-10}
          let(:y) {5}

          it 'returns false' do
            boundary = one_zero_east.coordinate
            expect(position.within_bounds(boundary, lower_bound: lower_bound)).to be false
          end
        end
      end
    end
  end
end