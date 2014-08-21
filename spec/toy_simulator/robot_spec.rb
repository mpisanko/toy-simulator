require 'spec_helper'

module ToySimulator
  describe Robot do

    describe '#execute' do

      let(:robot) {described_class.new(ToySimulator.configuration.boundary)}

      context 'robot has not been placed' do

        it 'ignores all commands other than place' do
          %i(left right move report).each do |command_name|
            command = Command.new(name: command_name)
            robot.execute(command)
            expect(report_result(robot)).to be_nil
          end
        end

        context 'when placement position is within bounds' do
          let(:args) { {facing: :east, x_axis: 4, y_axis: 0} }
          let(:command) { Command.new(name: :place, **args) }

          it 'places robot' do
            robot.execute(command)
            result = report_result(robot)
            expect(result).to be_a(Position)
            expect(result).to eq(Position.new(args))
          end
        end

        context 'when placement position is outside of bounds' do
          let(:args) { {facing: :east, x_axis: 15, y_axis: -1} }
          let(:command) { Command.new(name: :place, **args) }

          it 'ignores the command' do
            robot.execute(command)
            expect(report_result(robot)).to be_nil
          end
        end
      end

      context 'robot has been placed' do
        let(:x_axis) { 1 }
        let(:y_axis) { 1 }
        let(:facing) { :north }
        let(:args) { {x_axis: x_axis, y_axis: y_axis, facing: facing} }

        before do
          robot.execute(Command.new(name: :place, **args))
        end

        context 'report command' do
          it 'reports on current position' do
            report = robot.execute(Command.new(name: :report))
            expect(report).to eq(Position.new(args))
          end
        end

        context 'left command' do
          it 'turns the robot left' do
            robot.execute(Command.new(name: :left))
            expect(report_result(robot)).to eq(Position.new(facing: :west, x_axis: x_axis, y_axis: y_axis))
          end
        end

        context 'right command' do
          it 'turns the robot right' do
            robot.execute(Command.new(name: :right))
            expect(report_result(robot)).to eq(Position.new(facing: :east, x_axis: x_axis, y_axis: y_axis))
          end
        end

        context 'move command' do
          context 'when robot is within bounds' do
            it 'moves robot forward' do
              robot.execute(Command.new(name: :move))
              expect(report_result(robot)).to eq(Position.new(facing: facing, x_axis: x_axis, y_axis: y_axis + 1))
            end
          end

          context 'when robot would cross the bounds with movement' do
            let(:y_axis) { 4 }
            it 'leaves robot in place' do
              robot.execute(Command.new(name: :move))
              expect(report_result(robot)).to eq(Position.new(args))
            end
          end
        end
      end
    end
  end
end

REPORT_COMMAND = ToySimulator::Command.new(name: :report)
def report_result(robot)
  robot.execute(REPORT_COMMAND)
end
