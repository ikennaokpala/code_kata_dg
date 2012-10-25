class Product
  attr_reader :product_code, :price
  def initialize(product_code, price)
    @product_code,  @price = product_code, price
  end
end