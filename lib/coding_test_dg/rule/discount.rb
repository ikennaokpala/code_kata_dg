module Rule
  class Discount
    DEFAULT_RULE = {product_code:"SR1", qty:3, price:5.00, rate:0.1}
    def initialize(rule={})
      @rule = DEFAULT_RULE.merge(rule)
    end

    def apply(checkout)
      product_count = checkout.cart.map(&:product_code).count(@rule.fetch(:product_code))
      if product_count >= @rule.fetch(:qty)
        (@rule.fetch(:price) * @rule.fetch(:rate)) * product_count
      else
        0
      end
    end
  end
end