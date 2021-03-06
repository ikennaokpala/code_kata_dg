module Rule
  class Pricing
    attr_accessor :rules
    def intialize(rules=nil)
      @rules = rules
    end

    def product_pricing_rule
      Product.new
    end

    def discount_pricing_rule
      Discount.new
    end

    def pricing_rules
      [product_pricing_rule, discount_pricing_rule, @rules].compact
    end

    def apply(checkout)
      price_difference = pricing_rules.inject(0) { |sum, rule| sum + rule.apply(checkout)}
      (checkout.sub_total - price_difference).round(2)
    end
  end
end