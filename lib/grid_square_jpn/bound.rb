module GridSquareJpn
  class Bound
    attr_accessor :north
    attr_accessor :south
    attr_accessor :east
    attr_accessor :west

    def initialize north: nil, south: nil, east: nil, west: nil
      @north = north
      @south = south
      @east  = east
      @west  = west
    end
  end
end
