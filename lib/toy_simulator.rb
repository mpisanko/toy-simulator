require "toy_simulator/coordinate"
require "toy_simulator/bearing"
require "toy_simulator/position"
require "toy_simulator/command"
require "toy_simulator/robot"
require "toy_simulator/controller"
require "toy_simulator/console_adapter"

module ToySimulator
  def self.configuration 
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end
  
  # configuration for toy robot simulator - you can set table size
  class Configuration

    attr_writer :x_bound, :y_bound
    
    # by default the table is 5x5
    def initialize
      @x_bound = 4
      @y_bound = 4
    end

    def boundary
      Coordinate.new(
        y_axis: @y_bound, 
        x_axis: @x_bound
      ).freeze
    end

  end
end