module GridSquareJpn
  class Point
    attr_accessor :lat
    attr_accessor :lng

    def initialize(lat, lng)
      @lat = lat
      @lng = lng
    end

    def to_a
      [ @lat, @lng ]
    end
  end
end
