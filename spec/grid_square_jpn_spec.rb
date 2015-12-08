require 'spec_helper'

describe GridSquareJpn do
  it 'has a version number' do
    expect(GridSquareJpn::VERSION).not_to be nil
  end

  describe "primary" do
    before do
      @lat =  35.70078
      @lng = 139.71475
    end

    it "returns the mesh code of the primary area partition." do
      expect(GridSquareJpn.primary(@lat, @lng)).to eq "5339"
    end

    context "when the invalid values given," do
      it "raise OutOfRangeException." do
        @lat = 19.999
        expect {
          GridSquareJpn.primary(@lat, @lng)
        }.to raise_error GridSquareJpn::OutOfRangeException
      end
    end
  end

  describe "secondary" do
    before do
      @lat =  35.70078
      @lng = 139.71475
    end

    it "returns the mesh code of the secondary area partition." do
      expect(GridSquareJpn.secondary(@lat, @lng)).to eq "5339-45"
    end

    context "when the invalid values given," do
      it "raise OutOfRangeException." do
        @lat = 19.999
        expect {
          GridSquareJpn.secondary(@lat, @lng)
        }.to raise_error GridSquareJpn::OutOfRangeException
      end
    end
  end

  describe "basic" do
    before do
      @lat =  35.70078
      @lng = 139.71475
    end

    it "returns the mesh code of the basic grid square." do
      expect(GridSquareJpn.basic(@lat, @lng)).to eq "5339-45-47"
    end

    context "when the invalid values given," do
      it "raise OutOfRangeException." do
        @lat = 19.999
        expect {
          GridSquareJpn.basic(@lat, @lng)
        }.to raise_error GridSquareJpn::OutOfRangeException
      end
    end
  end

  describe "half" do
    before do
      @lat =  35.70078
      @lng = 139.71475
    end

    it "returns the mesh code of the half grid square." do
      expect(GridSquareJpn.half(@lat, @lng)).to eq "5339-45-47-1"
    end

    context "when the invalid values given," do
      it "raise OutOfRangeException." do
        @lat = 19.999
        expect {
          GridSquareJpn.half(@lat, @lng)
        }.to raise_error GridSquareJpn::OutOfRangeException
      end
    end
  end

  describe "quarter" do
    before do
      @lat =  35.70078
      @lng = 139.71475
    end

    it "returns the mesh code of the quarter grid square." do
      expect(GridSquareJpn.quarter(@lat, @lng)).to eq "5339-45-47-1-1"
    end

    context "when the invalid values given," do
      it "raise OutOfRangeException." do
        @lat = 19.999
        expect {
          GridSquareJpn.quarter(@lat, @lng)
        }.to raise_error GridSquareJpn::OutOfRangeException
      end
    end
  end

  describe "mesh_code" do
    before do
      @lat =  35.70078
      @lng = 139.71475
    end

    context "when :primary, :secondary, :basic, :half, :quarter are not given," do
      it "returns an empty Hash." do
        expect(GridSquareJpn.send(:mesh_code, @lat, @lng)).to be_instance_of Hash;
        expect(GridSquareJpn.send(:mesh_code, @lat, @lng)).to be_empty
      end
    end

    context "when true given as :primary," do
      before do
        @codes = GridSquareJpn.send(:mesh_code, @lat, @lng, primary: true)
      end

      it "returns a Hash object which includes :primary key." do
        expect(@codes.key?(:primary)).to be_truthy
      end

      it "calculate the mesh code of primary area partition." do
        expect(@codes[:primary]).to eq "5339"
      end
    end

    context "when true given as :secondary," do
      before do
        @codes = GridSquareJpn.send(:mesh_code, @lat, @lng, secondary: true)
      end

      it "returns a Hash object which includes :secodary key." do
        expect(@codes.key?(:secondary)).to be_truthy
      end

      it "calculate the mesh code of secondary area partition." do
        expect(@codes[:secondary]).to eq "45"
      end
    end

    context "when true given as :basic," do
      before do
        @codes = GridSquareJpn.send(:mesh_code, @lat, @lng, basic: true)
      end

      it "returns a Hash object which includes :basic key." do
        expect(@codes.key?(:basic)).to be_truthy
      end

      it "calculate the mesh code of basic grid square." do
        expect(@codes[:basic]).to eq "47"
      end
    end

    context "when true given as :half," do
      before do
        @codes = GridSquareJpn.send(:mesh_code, @lat, @lng, half: true)
      end

      it "returns a Hash object which includes :half key." do
        expect(@codes.key?(:half)).to be_truthy
      end

      it "calculate the mesh code of half grid square." do
        expect(@codes[:half]).to eq "1"
      end
    end

    context "when true given as :quarter," do
      before do
        @codes = GridSquareJpn.send(:mesh_code, @lat, @lng, quarter: true)
      end

      it "returns a Hash object which includes :quarter key." do
        expect(@codes.key?(:quarter)).to be_truthy
      end

      it "calculate the mesh code of quarter grid square." do
        expect(@codes[:quarter]).to eq "1"
      end
    end

  end

  describe "validate" do
    context "when the lat is less than 20.0," do
      it "raise OutOfRangeException." do
        expect {
          GridSquareJpn.send(:validate, 19.999, 122.0)
        }.to raise_error GridSquareJpn::OutOfRangeException
      end
    end

    context "when the lat is greater than 46.0," do
      it "raise OutOfRangeException." do
        expect {
          GridSquareJpn.send(:validate, 46.001, 122.0)
        }.to raise_error GridSquareJpn::OutOfRangeException
      end
    end

    context "when the lng is less than 122.0," do
      it "raise OutOfRangeException." do
        expect {
          GridSquareJpn.send(:validate, 20.0, 121.999)
        }.to raise_error GridSquareJpn::OutOfRangeException
      end
    end

    context "when the lng is greater than 154.0," do
      it "raise OutOfRangeException." do
        expect {
          GridSquareJpn.send(:validate, 20.0, 154.001)
        }.to raise_error GridSquareJpn::OutOfRangeException
      end
    end

    context "when valid lat and lng given," do
      it "returns true." do
        expect(GridSquareJpn.send(:validate, 20.0, 122.0)).to be_truthy
        expect(GridSquareJpn.send(:validate, 46.0, 154.0)).to be_truthy
      end
    end
  end

  describe "format" do
    it "joins each values with SEPARATOR." do
      expect(GridSquareJpn.send(:format, "1", "2", "3")).to eq "1-2-3"
    end
  end

end
