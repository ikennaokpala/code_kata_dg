require 'spec_helper'

describe Rule::Discount do
  it "does not apply discount rule with less than three Strawberries in cart" do
    item = mock("Product", :product_code => "SR1", :price => 5.00)
    checkout = mock("Checkout", :cart => [item])
    subject.apply(checkout).should == 0
  end

  it "applies discount pricing rule for three Strawberries in cart" do
    item1 = mock("Product", :product_code => "SR1", :price => 5.00)
    item2 = mock("Product", :product_code => "SR1", :price => 5.00)
    item3 = mock("Product", :product_code => "SR1", :price => 5.00)
    checkout = mock("Checkout", :cart => [item1, item2, item3])
    subject.apply(checkout).should == 1.5
  end

  it "applies discount pricing rule for more than three Strawberries in cart" do
    item1 = mock("Product", :product_code => "SR1", :price => 5.00)
    item2 = mock("Product", :product_code => "SR1", :price => 5.00)
    item3 = mock("Product", :product_code => "SR1", :price => 5.00)
    item4 = mock("Product", :product_code => "SR1", :price => 5.00)
    item5 = mock("Product", :product_code => "SR1", :price => 5.00)

    checkout = mock("Checkout", :cart => [item1, item2, item3, item4, item5])
    subject.apply(checkout).should == 2.5
  end
end