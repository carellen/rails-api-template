10.times do
  Product.create(
    name: FFaker::Product.product_name,
    description: FFaker::Product.product,
    price: rand(1..20)
  )
end
