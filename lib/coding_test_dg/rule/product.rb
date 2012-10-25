module Rule
  class Product
    DEFAULT_RULE = {product_code:"FR1", qty:2, price:3.11}
    def initialize(rule={})
      @rule = DEFAULT_RULE.merge(rule)
    end

    def apply(checkout)
      ft_products = checkout.cart.select(&:product_code)#.count(@rule.fetch(:product_code))
      free_products = ft_products.each_slice(2).count{|x|x.size%2==0}
      puts "free #{@rule.fetch(:price) * free_products}"
      @rule.fetch(:price) * free_products
    end
  end
end