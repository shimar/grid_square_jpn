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

    #
    # Return the Point of south-west.
    # @return [Point] the south-west point.
    #
    def sw
      Point.new south, west
    end

    #
    # Return the Point of south-east.
    # @return [Point] the south-east point.
    #
    def se
      Point.new south, east
    end

    #
    # Return the Point of north-west.
    # @return [Point] the north-west point.
    #
    def nw
      Point.new north, west
    end

    #
    # Return the Point of north-east.
    # @return [Point] the north-east point.
    #
    def ne
      Point.new north, east
    end
  end
end
