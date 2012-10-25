module Rule
  class Discount
    DEFAULT_RULE = {product_code:"SR1", qty:3, price:4.50}
    def initialize(rule={})
      @rule = DEFAULT_RULE.merge(rule)
    end

    def apply(checkout)
      product_count = checkout.cart.map(&:product_code).count(@rule.fetch(:product_code))
      if product_count >= @rule.fetch(:qty)
        @rule.fetch(:price) * product_count
      else
        checkout.cart.map(&:price).first * product_count
      end
    end
  end
end