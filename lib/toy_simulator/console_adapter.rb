module ToySimulator
  
  # use console as the interface between robot and command provider.
  class ConsoleAdapter

    def self.run
      controller = Controller.new(Robot.new(ToySimulator.configuration.boundary))
      controller.send_commands(read_and_parse_commands)
      report_results(controller.receive_results)
    end

    PARAMETER_NAMES = %i(x_axis y_axis facing)
    
    def self.read_and_parse_commands
      STDIN.read.split("\n").map do |command|
        command_name, parameters = command.split
        params = create_command_parameters(parameters)
        Command.new(name: command_name.downcase.to_sym, **params)
      end
    end
  
    def self.create_command_parameters(parameters)
      if parameters
        parameters = PARAMETER_NAMES.zip(parameters.split(',')).to_h.tap do |params|
          params[:x_axis] = params[:x_axis].to_i
          params[:y_axis] = params[:y_axis].to_i
          params[:facing] = params[:facing].downcase.to_sym
        end
      else
        {}
      end
    end

    def self.report_results(results)
      formatted_results = results.map do |result|
        format_result(result)
      end.join("\n")
      STDOUT.write(formatted_results)
    end

    def self.format_result(result)
      coordinate = result[:coordinate]
      %Q(#{coordinate[:x_axis]},#{coordinate[:y_axis]},#{result[:facing].to_s.upcase})
    end
    
    private_class_method :read_and_parse_commands, :report_results, :format_result, :create_command_parameters
    
  end
end