require 'spec_helper'

describe GridSquareJpn do
  it 'has a version number' do
    expect(GridSquareJpn::VERSION).not_to be nil
  end


  describe "validate" do
    context "when the lat is less than 20.0," do
      it "raise OutOfRangeException."
    end

    context "when the lat is greater than 46.0," do
      it "raise OutOfRangeException."
    end

    context "when the lng is less than 122.0," do
      it "raise OutOfRangeException."
    end

    context "when the lng is greater than 154.0," do
      it "raise OutOfRangeException."
    end

    context "when valid lat and lng given," do
      it "returns true."
    end
  end

end
