class Cart < ActiveModelSerializers::Model
  attr_reader :products

  def initialize(products = {})
    @products = products
  end

  def add(product)
    new_entry = Hash[product[:product_id].to_i, product[:quantity].to_i]
    products.merge!(new_entry) { |id, quantity, add| quantity + add }
  end

  def remove(product_id)
    products[product_id] > 1 ? products[product_id] -= 1 : products.delete(product_id)
  end

  def calculate_products
    products.map do |id, quantity|
      product = Product.find(id)
      {
        id: id,
        quantity: quantity,
        sum: product.price * quantity
      }
    end
  end

  def total_sum
    calculate_products.sum { |product| product[:sum] }
  end

  def products_count
    calculate_products.sum { |product| product[:quantity] }
  end
end