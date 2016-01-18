require 'spec_helper'

describe GridSquareJpn::Bound do

  describe "initialize" do
    it "set nil to all attrs when no args given." do
      bound = GridSquareJpn::Bound.new
      expect(bound.north).to be_nil
      expect(bound.south).to be_nil
      expect(bound.east).to be_nil
      expect(bound.west).to be_nil
    end

    it "set attrs." do
      bound = GridSquareJpn::Bound.new(north: 46.0, south: 20.0, east: 154.0, west: 122.0)
      expect(bound.north).to eq 46.0
      expect(bound.south).to eq 20.0
      expect(bound.east).to eq 154.0
      expect(bound.west).to eq 122.0
    end
  end

end
