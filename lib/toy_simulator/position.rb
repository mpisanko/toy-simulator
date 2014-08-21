module ToySimulator
  # position is location and orientation in a two dimensional grid along x and y axes.
  # it abstracts rudimentary transitions between positions.\
  # it is immutable.
  class Position
    
    attr_reader :bearing, :coordinate

    def initialize(x_axis:, y_axis:, facing:)
      @coordinate, @bearing = Coordinate.new(x_axis: x_axis, y_axis: y_axis), Bearing.for(facing)
    end

    def forward
      Position.position_for(bearing: bearing, coordinate: coordinate.add(bearing.forward))
    end

    def left
      Position.position_for(bearing: bearing.left, coordinate: coordinate)
    end

    def right
      Position.position_for(bearing: bearing.right, coordinate: coordinate)
    end
    
    def to_h
      bearing.to_h.merge(coordinate: coordinate.to_h)
    end

    def ==(other)
      bearing == other.bearing && coordinate == other.coordinate
    end

    def within_bounds(boundary, lower_bound: ZERO)
      coordinate >= lower_bound && coordinate <= boundary
    end

    def self.position_for(bearing:, coordinate:)
       Position.new(facing: bearing.facing, x_axis: coordinate.x_axis, y_axis: coordinate.y_axis)
    end 

    private

    ZERO = Coordinate.new(x_axis: 0, y_axis: 0)

  end
end
