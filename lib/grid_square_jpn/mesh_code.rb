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

    #
    # build an MeshCode object by code string.
    #
    # @param [String] code a string of mesh code.
    # @return [MeshCode] a instance of MeshCode.
    #
    def self.build code
      # TODO
    end

    private

    #
    # return whether the code is vaild.
    #
    # @param [String] code a string of mesh code.
    # @return [Boolean] true if valid.
    #
    def self.valid_code? code
      # TODO
    end
  end
end
