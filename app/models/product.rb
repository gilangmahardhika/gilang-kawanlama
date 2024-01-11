class Product < ApplicationRecord

  validates_presence_of :name, :sku, :count
  validates_uniqueness_of :sku
  validates_numericality_of :count
end
