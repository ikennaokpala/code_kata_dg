module Rule
  class Product
    DEFAULT_RULE = {product_code:"FR1", qty:2, price:3.11}
    def initialize(rule={})
      @rule = DEFAULT_RULE.merge(rule)
    end

    def apply(checkout)
      product_count = checkout.cart.map(&:product_code).count(@rule.fetch(:product_code))
      if product_count % @rule.fetch(:qty)  == 0
        @rule.fetch(:price) * (product_count/2)
      else
        product_count-=1
        (@rule.fetch(:price) * (product_count/2)) + @rule.fetch(:price)
      end
    end
  end
end