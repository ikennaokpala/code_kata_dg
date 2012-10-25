require 'spec_helper'

describe Rule::Product do
  it "does not apply product pricing rule with only one Fruit tea in cart" do
    item = mock("Product", :product_code => "FR1", :price => 3.11)
    checkout = mock("Checkout", :cart => [item])
    subject.apply(checkout).should == 0
  end

  it "applies product pricing rule for two Fruit tea in cart" do
    item1 = mock("Product", :product_code => "FR1", :price => 3.11)
    item2 = mock("Product", :product_code => "FR1", :price => 3.11)
    checkout = mock("Checkout", :cart => [item1, item2])
    subject.apply(checkout).should == 3.11
  end
end