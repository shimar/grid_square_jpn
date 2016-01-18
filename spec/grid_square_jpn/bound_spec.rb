require 'spec_helper'

describe GridSquareJpn::Bound do

  describe "initialize" do
    it "set attrs." do
      bound = GridSquareJpn::Bound.new(north: 46.0, south: 20.0, east: 154.0, west: 122.0)
      expect(bound.north).to eq 46.0
      expect(bound.south).to eq 20.0
      expect(bound.east).to eq 154.0
      expect(bound.west).to eq 122.0
    end
  end

  describe "sw" do
    before do
      @bound = GridSquareJpn::Bound.new(north: 46.0, south: 20.0, east: 154.0, west: 122.0)
    end

    it "returns an object of Point." do
      expect(@bound.sw).to be_instance_of GridSquareJpn::Point
    end

    it "returns the point of south-west." do
      expect(@bound.sw.to_a).to eq [ 20.0, 122.0 ]
    end
  end

  describe "se" do
    before do
      @bound = GridSquareJpn::Bound.new(north: 46.0, south: 20.0, east: 154.0, west: 122.0)
    end

    it "returns an object of Point." do
      expect(@bound.se).to be_instance_of GridSquareJpn::Point
    end

    it "returns the point of south-east." do
      expect(@bound.se.to_a).to eq [ 20.0, 154.0 ]
    end
  end

  describe "nw" do
    before do
      @bound = GridSquareJpn::Bound.new(north: 46.0, south: 20.0, east: 154.0, west: 122.0)
    end

    it "returns an object of Point." do
      expect(@bound.nw).to be_instance_of GridSquareJpn::Point
    end

    it "returns the point of north-west." do
      expect(@bound.nw.to_a).to eq [ 46.0, 122.0 ]
    end
  end

  describe "ne" do
    before do
      @bound = GridSquareJpn::Bound.new(north: 46.0, south: 20.0, east: 154.0, west: 122.0)
    end

    it "returns an object of Point." do
      expect(@bound.ne).to be_instance_of GridSquareJpn::Point
    end

    it "returns the point of north-east." do
      expect(@bound.ne.to_a).to eq [ 46.0, 154.0 ]
    end
  end

end
