require 'spec_helper'

describe Checkout do
  before :each do
    @pricing_rules = Rule::Pricing.new
  end

  it "its price should be 22.45 " do
    item1 = Product.new("FR1", 3.11)
    item2 = Product.new("SR1", 5.00)
    item3 = Product.new("FR1", 3.11)
    item4 = Product.new("FR1", 3.11)
    item5 = Product.new("CF1", 11.23)
    co = Checkout.new(@pricing_rules)
    co.scan(item1)
    co.scan(item2)
    co.scan(item3)
    co.scan(item4)
    co.scan(item5)
    price = co.total
    price.should == 22.45
  end

  it "returns the price of the checkout" do
    item1 = Product.new("FR1", 3.11)
    item2 = Product.new("FR1", 3.11)
    co = Checkout.new(@pricing_rules)
    co.scan(item1)
    co.scan(item2)
    price = co.total
    price.should == 3.11
  end

  it "returns the price of the checkout" do
    item1 = Product.new("SR1", 5.00)
    item2 = Product.new("SR1", 5.00)
    item3 = Product.new("FR1", 3.11)
    item4 = Product.new("SR1", 5.00)
    co = Checkout.new(@pricing_rules)
    co.scan(item1)
    co.scan(item2)
    co.scan(item3)
    co.scan(item4)
    price = co.total
    price.should == 16.61
  end
end