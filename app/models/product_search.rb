class ProductSearch
  def search(query, order, sort)
    order_value = determine_order_value(order)
    sort_value = determine_sort_value(sort)
    if query.blank?
      Product.all.ordered_by(order_value, sort_value)
    else
      search_by_ts_factor(query, order_value, sort_value)
    end
  end

  private
    def determine_order_value(order)
      order.blank? ? "name" : order
    end

    def determine_sort_value(sort)
      sort.blank? ? "asc" : sort
    end

    def search_by_ts_factor(query, order, sort)
      Product.search_product(query)
      .reorder("")
      .all.ordered_by(order, sort)
    end
end
