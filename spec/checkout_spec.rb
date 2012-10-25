require 'spec_helper'

describe Checkout do
  its(:total){ should == 22.45}
  its(:total){ should == 3.11}
  its(:total){ should == 16.61}
end