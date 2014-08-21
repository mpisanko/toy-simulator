require 'spec_helper'

module ToySimulator
  describe ConsoleAdapter do
    describe ".run" do

      context 'with longer list of commands' do
        let(:commands) do 
          File.read('spec/fixtures/commands_1.txt')
        end 
        it 'runs commands and reports results' do
          allow(STDIN).to receive(:read).and_return(commands)
          expect(STDOUT).to receive(:write).with("0,4,NORTH\n3,1,SOUTH")
          described_class.run
        end
      end

      context 'with example a commands from assignment' do
        let(:commands) do 
          File.read('spec/fixtures/commands_a.txt')
        end 
        it 'runs commands and reports results' do
          allow(STDIN).to receive(:read).and_return(commands)
          expect(STDOUT).to receive(:write).with('0,1,NORTH')
          described_class.run
        end
      end

      context 'with example b commands from assignment' do
        let(:commands) do 
          File.read('spec/fixtures/commands_b.txt')
        end 
        it 'runs commands and reports results' do
          allow(STDIN).to receive(:read).and_return(commands)
          expect(STDOUT).to receive(:write).with('0,0,WEST')
          described_class.run
        end
      end

      context 'with example c commands from assignment' do
        let(:commands) do 
          File.read('spec/fixtures/commands_c.txt')
        end 
        it 'runs commands and reports results' do
          allow(STDIN).to receive(:read).and_return(commands)
          expect(STDOUT).to receive(:write).with('3,3,NORTH')
          described_class.run
        end
      end
    end
  end
end