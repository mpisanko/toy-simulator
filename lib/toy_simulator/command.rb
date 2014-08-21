module ToySimulator
  # abstracts different commands with optional parameters.
  # it is immutable.
  class Command
    
    attr_reader :name, :parameters

    def initialize(name:, **parameters)
      @name, @parameters = name, parameters
    end

  end
end