require 'spec_helper'

describe GridSquareJpn::Point do

  describe "initialize" do
    it "set attrs." do
      point = GridSquareJpn::Point.new 20.0, 122.0
      expect(point.lat).to eq 20.0
      expect(point.lng).to eq 122.0
    end
  end


  describe "to_a" do
    it "returns an array object that contains lat and lng." do
      point = GridSquareJpn::Point.new(nil, nil)
      expect(point.to_a).to eq [nil, nil]

      point = GridSquareJpn::Point.new 20.0, 122.0
      expect(point.to_a).to eq [ 20.0, 122.0 ]
    end
  end
end
