class Checkout
  attr_accessor :cart, :pricing_rules
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @cart = []
  end

  def scan(item)
    @cart << item
  end

  def total
    @pricing_rules.apply(self)
  end
end