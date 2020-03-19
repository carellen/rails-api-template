FactoryBot.define do
  factory :product do
    name { FFaker::Product.product_name }
    description { FFaker::Product.product }
    price { rand(1..20) }
  end
end
