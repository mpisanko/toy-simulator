module ToySimulator
  # bearing is an enumeration of basic compass directions. 
  # it abstraction how current bearing would change moving left, right or forward along x and y axes. 
  # it is immutable.
  class Bearing
    
    attr_reader :facing, :forward

    def left
      BEARINGS[position - 1]
    end

    def right
      BEARINGS[(position + 1) % BEARINGS.length]
    end

    def to_h
      {facing: facing}
    end
    
    def ==(other)
      facing == other.facing  
    end

    def self.for(direction)
      BEARINGS.find { |bearing| bearing.facing == direction }
    end

    def self.south
      SOUTH
    end

    def self.west
      WEST
    end

    def self.north
      NORTH
    end

    def self.east
      EAST
    end

    private_class_method :new
  
    private 

    def initialize(facing:, forward:)
      @facing, @forward = facing, forward
    end

    def position
      BEARINGS.index(self)
    end

    SOUTH = new(facing: :south, forward: Coordinate.new(x_axis: 0, y_axis: -1))
    WEST = new(facing: :west, forward: Coordinate.new(x_axis: -1, y_axis: 0))
    NORTH = new(facing: :north, forward: Coordinate.new(x_axis: 0, y_axis: 1))
    EAST = new(facing: :east, forward: Coordinate.new(x_axis: 1, y_axis: 0))
    BEARINGS = [ SOUTH, WEST, NORTH, EAST ].freeze

  end
end