require "grid_square_jpn/version"
require "grid_square_jpn/exceptions"

module GridSquareJpn

  #
  # get the mesh code of primary area partition.
  # @param  [Float]  lat  latitude.
  # @param  [Float]  lng  longitude.
  # @return [String] the mesh code.
  #
  def primary(lat, lng)
  end

  #
  # get the mesh code of secondary area partition.
  # @param  [Float]  lat  latitude.
  # @param  [Float]  lng  longitude.
  # @return [String] the mesh code.
  #
  def secondary(lat, lng)
  end

  #
  # get the mesh code of basic grid square.
  # @param  [Float]  lat  latitude.
  # @param  [Float]  lng  longitude.
  # @return [String] the mesh code.
  #
  def basic(lat, lng)
  end

  #
  # get the mesh code of half grid square.
  # @param  [Float]  lat  latitude.
  # @param  [Float]  lng  longitude.
  # @return [String] the mesh code.
  #
  def half(lat, lng)
  end

  #
  # get the mesh code of quarter grid square.
  # @param  [Float]  lat  latitude.
  # @param  [Float]  lng  longitude.
  # @return [String] the mesh code.
  #
  def quarter(lat, lng)
  end

end
