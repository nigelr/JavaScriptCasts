require File.dirname(__FILE__) + '/../spec_helper'

describe Interest do
  it "should be valid" do
    Interest.new.should be_valid
  end
end
