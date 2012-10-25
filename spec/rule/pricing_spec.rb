require 'spec_helper'

describe Rule::Pricing do
  context "apply pricing rules" do
    it "can apply the product pricing rule" do
      item = mock("Product", :product_code => "FR1", :price => 3.11)
      checkout = mock("Checkout", :cart => [item, item], :sub_total => 6.22)
      subject.apply(checkout).should == 3.11
    end

    it "can apply the discount pricing rule" do
      item = mock("Product", :product_code => "SR1", :price => 5.00)
      checkout = mock("Checkout", :cart => [item, item, item, item], :sub_total => 20.00)
      subject.apply(checkout).should == 18.00
    end
  end
end