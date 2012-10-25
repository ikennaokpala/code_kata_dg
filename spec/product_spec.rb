require 'spec_helper'

describe Product do
   let(:fruit_tea){Product.new("FR1", 3.11)}
   subject{fruit_tea}
   its(:product_code){should == "FR1"}
   its(:price){should == 3.11}
end