module ToySimulator
  # coordinate is a point in a two dimentional grid with x and y axes.
  # it is immutable.
  class Coordinate

    attr_reader :x_axis, :y_axis

    def initialize(x_axis:, y_axis:)
      @x_axis, @y_axis = x_axis, y_axis
    end

    def add(other)
      Coordinate.new(x_axis: (x_axis + other.x_axis), y_axis: (y_axis + other.y_axis))
    end

    def to_h
      {x_axis: x_axis, y_axis: y_axis}
    end

    def ==(other)
      x_axis == other.x_axis && y_axis == other.y_axis
    end

    def >=(other)
      x_axis >= other.x_axis && y_axis >= other.y_axis
    end

    def <=(other)
      x_axis <= other.x_axis && y_axis <= other.y_axis
    end

  end
end