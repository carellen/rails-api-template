class CartSerializer < ActiveModel::Serializer
  attributes :total_sum, :products_count, :products

  def total_sum
    object.total_sum
  end

  def products_count
    object.products_count
  end

  def products
    object.calculate_products
  end
end
