class Product < ApplicationRecord

  validates_presence_of :name, :sku, :count
  validates_uniqueness_of :sku
  validates_numericality_of :count

  mount_uploader :first_photo, ProductUploader
  mount_uploader :second_photo, ProductUploader
  mount_uploader :third_photo, ProductUploader

  scope :order_by_created, -> (q) { order(created_at: q) }
end
