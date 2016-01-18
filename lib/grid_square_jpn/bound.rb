module GridSquareJpn
  class Bound
    attr_accessor :north
    attr_accessor :south
    attr_accessor :east
    attr_accessor :west

    #
    # initialize this object with given coordinates.
    #
    def initialize north: , south: , east: , west:
      @north = north
      @south = south
      @east  = east
      @west  = west
    end
  end
end
