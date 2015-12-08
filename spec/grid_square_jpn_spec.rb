require 'spec_helper'

describe GridSquareJpn do
  it 'has a version number' do
    expect(GridSquareJpn::VERSION).not_to be nil
  end

  describe "primary"

  describe "secondary"

  describe "basic"

  describe "half"

  describe "quarter"

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

end
