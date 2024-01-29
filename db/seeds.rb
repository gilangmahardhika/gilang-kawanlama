# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

(1..500000).each.with_index(1) do |i|
  begin
    Product.create! do |p|
      p.name = Faker::Commerce.product_name
      p.sku = Faker::Barcode.ean(13)
      p.count =  rand(1..100)
      p.description = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true)
      # p.remote_first_photo_url = Faker::LoremFlickr.image(size: "150x150")
    end
    puts "create #{i}"
  rescue
    puts "failed #{i}"
  end
end

# Seeds Admin User
User.create do |u|
  User.create(name: "Admin", email: "admin@example.com", password: "password", role: "Admin")
  puts "*"
end

# Seeds User
User.create do |u|
  User.create(name: "User", email: "user@example.com", password: "password", role: "User")
  puts "*"
end
