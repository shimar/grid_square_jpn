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

  # the separator of codes.
  SEPARATOR = "-"

  #
  # get the mesh code of primary area partition.
  #
  # @param  [Float]  lat  latitude.
  # @param  [Float]  lng  longitude.
  # @return [String] the mesh code.
  #
  def self.primary(lat, lng)
    validate(lat, lng)
    codes = mesh_code(lat, lng, primary: true)
    codes[:primary]
  end

  #
  # get the mesh code of secondary area partition.
  #
  # @param  [Float]  lat  latitude.
  # @param  [Float]  lng  longitude.
  # @return [String] the mesh code.
  #
  def self.secondary(lat, lng)
    validate(lat, lng)
    codes = mesh_code(lat, lng, secondary: true)
    codes[:secondary]
  end

  #
  # get the mesh code of basic grid square.
  #
  # @param  [Float]  lat  latitude.
  # @param  [Float]  lng  longitude.
  # @return [String] the mesh code.
  #
  def self.basic(lat, lng)
    validate(lat, lng)
    codes = mesh_code(lat, lng, basic: true)
    codes[:basic]
  end

  #
  # get the mesh code of half grid square.
  #
  # @param  [Float]  lat  latitude.
  # @param  [Float]  lng  longitude.
  # @return [String] the mesh code.
  #
  def self.half(lat, lng)
    validate(lat, lng)
    codes = mesh_code(lat, lng, half: true)
    codes[:half]
  end

  #
  # get the mesh code of quarter grid square.
  #
  # @param  [Float]  lat  latitude.
  # @param  [Float]  lng  longitude.
  # @return [String] the mesh code.
  #
  def self.quarter(lat, lng)
    validate(lat, lng)
    codes = mesh_code(lat, lng, quarter: true)
    codes[:quarter]
  end

  private

  #
  # get the mesh code of given location.
  #
  # this method is an just implementation of http://www.stat.go.jp/data/mesh/pdf/gaiyo1.pdf
  #
  # @param [Float] lat latitude
  # @param [Float] lng longitude
  # @return [Hash] a set of mesh codes.
  #
  def self.mesh_code(lat, lng, primary: false, secondary: false, basic: false, half: false, quarter: false)
    codes = {}
    # primary mesh code.
    pa = (lat * 60).divmod(40)
    uf = [ (lng.floor) - 100, lng % 1 ]
    codes[:primary] = pa[0].to_s + uf[0].to_s if primary

    # secondary mesh code.
    qb = pa[1].divmod(5)
    vg = (uf[1] * 60).divmod(7.5)
    codes[:secondary] = qb[0].to_s + vg[0].to_s if secondary

    # basic mesh code.
    rc = (qb[1] * 60).divmod(30)
    wh = (vg[1] * 60).divmod(45)
    codes[:basic] = rc[0].to_s + wh[0].to_s if basic

    # half mesh code.
    sd = rc[1].divmod(15)
    xi = wh[1].divmod(22.5)
    m = (sd[0] * 2) + (xi[0] + 1)
    codes[:half] = m.to_s if half

    # quarter mesh code.
    te = sd[1].divmod(7.5)
    yj = xi[1].divmod(11.25)
    n = (te[0] * 2) + (yj[0] + 1)
    codes[:quarter] = n.to_s if quarter

    codes
  end

  def self.validate(lat, lng)
    raise OutOfRangeException.new("lat should be in #{LAT_RANGE}.") unless LAT_RANGE.include? lat
    raise OutOfRangeException.new("lng should be in #{LNG_RANGE}.") unless LNG_RANGE.include? lng
    true
  end

end
