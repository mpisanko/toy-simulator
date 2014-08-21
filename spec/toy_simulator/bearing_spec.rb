require 'spec_helper'

module ToySimulator
  describe Bearing do
    
    describe '.new' do
      it 'is private and cannot be called from outside the class' do
        expect {Bearing.new(facing: :south, forward: nil)}.to raise_error
      end
    end

    describe '.for' do

      let(:direction) {:south}
      let(:bearing) { described_class.for(direction) }

      context 'with valid direction' do
        it 'returns a valid bearing' do
          expect(bearing).to eq Bearing.south
        end

        context 'as symbol' do
          let(:direction) {:north}
          it 'returns a valid bearing' do
            expect(bearing).to eq Bearing.north
          end
        end
      end

      context 'with invalid direction' do
        let(:direction) {:invalid}
        let(:bearing) { described_class.for(direction) }
        it 'returns nil' do
          expect(bearing).to eq nil
        end
      end
    end

    describe '#left' do
      context 'north' do
        it 'returns west' do
          expect(Bearing.north.left).to eq Bearing.west
        end
      end
      context 'south' do
        it 'returns east' do
          expect(Bearing.south.left).to eq Bearing.east
        end
      end
    end

    describe '#right' do
      context 'east' do
        it 'returns south' do
          expect(Bearing.east.right).to eq Bearing.south
        end
      end

      context 'west' do
        it 'returns north' do
          expect(Bearing.west.right).to eq Bearing.north
        end
      end
    end

    describe '#to_h' do
      it 'returns a hash describing the bearing' do
        expect(Bearing.east.to_h).to eq({facing: :east})
      end
    end
  end
end