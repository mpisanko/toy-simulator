module ToySimulator
  # controls robot sending it commands and getting it's reports.
  class Controller
    
    def initialize(robot)
      @robot = robot
    end

    def send_commands(commands)
      @results = commands.map do |command| 
        robot.execute(command)
      end
    end

    def receive_results
      results.compact.map(&:to_h)
    end

    private 
    attr_reader :robot, :results
  end
end