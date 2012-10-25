require 'spec_helper'

describe Checkout do
  before :each do
    @pricing_rules = Rule::Pricing.new
  end

  it "returns the price (22.45) from the checkout" do
    item1 = mock("Product", :product_code => "FR1", :price => 3.11)
    item2 = mock("Product", :product_code => "SR1", :price => 5.00)
    item3 = mock("Product", :product_code => "FR1", :price => 3.11)
    item4 = mock("Product", :product_code => "FR1", :price => 3.11)
    item5 = mock("Product", :product_code => "CF1", :price => 11.23)
    co = Checkout.new(@pricing_rules)
    co.scan(item1)
    co.scan(item2)
    co.scan(item3)
    co.scan(item4)
    co.scan(item5)
    price = co.total
    price.should == 22.45
  end

  it "returns the price (3.11) from the checkout" do
    item1 = mock("Product", :product_code => "FR1", :price => 3.11)
    item2 = mock("Product", :product_code => "FR1", :price => 3.11)
    co = Checkout.new(@pricing_rules)
    co.scan(item1)
    co.scan(item2)
    price = co.total
    price.should == 3.11
  end

  it "returns the price 16.61 from the checkout" do
    item1 = mock("Product", :product_code => "SR1", :price => 5.00)
    item2 = mock("Product", :product_code => "SR1", :price => 5.00)
    item3 = mock("Product", :product_code => "FR1", :price => 3.11)
    item4 = mock("Product", :product_code => "SR1", :price => 5.00)
    co = Checkout.new(@pricing_rules)
    co.scan(item1)
    co.scan(item2)
    co.scan(item3)
    co.scan(item4)
    price = co.total
    price.should == 16.61
  end
end