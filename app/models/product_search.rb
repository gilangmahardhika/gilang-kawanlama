class ProductSearch < Product
  def self.search(query, order, sort)
    self.superclass.search_product(query)
    .reorder("")
    .ordered_by(order, sort)
  end

end
