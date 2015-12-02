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
    context "when :primary, :secondary, :basic, :half, :quarter are not given," do
      it "returns an empty Hash." do
        expect(GridSquareJpn.send(:mesh_code, 22.0, 154.0)).to be_instance_of Hash;
        expect(GridSquareJpn.send(:mesh_code, 22.0, 154.0)).to be_empty
      end
    end

    context "when true given as :primary," do
      it "returns a Hash object which includes :primary key."
    end

    context "when true given as :secondary," do
      it "returns a Hash object which includes :secodary key."
    end

    context "when true given as :basic," do
      it "returns a Hash object which includes :basic key."
    end

    context "when true given as :half," do
      it "returns a Hash object which includes :half key."
    end

    context "when true given as :quarter," do
      it "returns a Hash object which includes :quarter key."
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
