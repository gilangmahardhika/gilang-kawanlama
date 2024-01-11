FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    sku { Faker::Barcode.ean(13) }
    count { 10 }
    first_photo {  }
    second_photo {  }
    third_photo {  }
  end
end
