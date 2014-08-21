module ToySimulator
  # Toy Robot Simulator - the robot takes commands and moves on a two dimensional plane along x and y axes.
  # It knows boundaries of the grid and not to cross them.
  class Robot
    
    def initialize(boundary)
      @boundary = boundary
    end

    def execute(command)
      command_name = command.name
      send(command_name, command.parameters) if executable?(command_name)
    end

    private

    attr_reader :boundary, :position
    
    INIT_COMMANDS = %i(place)
    MOVE_REPORT_COMMANDS = %i(move left right report)
    
    def executable?(command)
      INIT_COMMANDS.include?(command) || move_report_command_and_initialised?(command)
    end

    def move_report_command_and_initialised?(command)
      MOVE_REPORT_COMMANDS.include?(command) && position
    end

    def report(**args)
      position
    end

    def left(**args)
      move_if_valid(position.left)
    end

    def right(**args)
      move_if_valid(position.right)
    end

    def move(**args)
      move_if_valid(position.forward)
    end

    def place(x_axis:, y_axis:, facing:)
      move_if_valid(Position.new(x_axis: x_axis, y_axis: y_axis, facing: facing))
    end

    def move_if_valid(target)
      @position = target if target.within_bounds(boundary)
      nil
    end

  end
end