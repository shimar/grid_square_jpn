module GridSquareJpn
  class MeshCode
    SEPARATOR = "-"

    attr_accessor :primary
    attr_accessor :secondary
    attr_accessor :basic
    attr_accessor :half
    attr_accessor :quarter

    def initialize primary: , secondary: nil, basic: nil, half: nil, quarter: nil
      @primary   = primary
      @secondary = secondary
      @basic     = basic
      @half      = half
      @quarter   = quarter
    end
  end
end
