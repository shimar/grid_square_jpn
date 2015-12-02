require "grid_square_jpn/version"
require "grid_square_jpn/exceptions"

module GridSquareJpn

  # the minimum value of latitude.
  LAT_MIN = 20.0

  # the maximum value of latitude.
  LAT_MAX = 46.0

  # the minimum value of longitude.
  LNG_MIN = 122.0

  # the maximum value of longitude.
  LNG_MAX = 154.0

  # the range of valid latitude.
  LAT_RANGE = LAT_MIN..LAT_MAX

  # the range of valid longitude.
  LNG_RANGE = LNG_MIN..LNG_MAX

  #
  # get the mesh code of primary area partition.
  # @param  [Float]  lat  latitude.
  # @param  [Float]  lng  longitude.
  # @return [String] the mesh code.
  #
  def self.primary(lat, lng)
  end

  #
  # get the mesh code of secondary area partition.
  # @param  [Float]  lat  latitude.
  # @param  [Float]  lng  longitude.
  # @return [String] the mesh code.
  #
  def self.secondary(lat, lng)
    # TODO
  end

  #
  # get the mesh code of basic grid square.
  # @param  [Float]  lat  latitude.
  # @param  [Float]  lng  longitude.
  # @return [String] the mesh code.
  #
  def self.basic(lat, lng)
    # TODO
  end

  #
  # get the mesh code of half grid square.
  # @param  [Float]  lat  latitude.
  # @param  [Float]  lng  longitude.
  # @return [String] the mesh code.
  #
  def self.half(lat, lng)
    # TODO
  end

  #
  # get the mesh code of quarter grid square.
  # @param  [Float]  lat  latitude.
  # @param  [Float]  lng  longitude.
  # @return [String] the mesh code.
  #
  def self.quarter(lat, lng)
    # TODO
  end

  private

  #
  # get the mesh code of given location.
  #
  # @param [Float] lat latitude
  # @param [Float] lng longitude
  # @return [Hash] a set of mesh codes.
  #
  def self.mesh_code(lat, lng, primary: false, seconday: false, basic: false, half: false, quarter: false)
    codes = {}
    codes
  end

  def self.validate(lat, lng)
    raise OutOfRangeException.new("lat should be in #{LAT_RANGE}.") unless LAT_RANGE.include? lat
    raise OutOfRangeException.new("lng should be in #{LNG_RANGE}.") unless LNG_RANGE.include? lng
    true
  end

end
