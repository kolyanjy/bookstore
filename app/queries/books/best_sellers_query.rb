module Books
  class BestSellersQuery
    def call(quantity)
      Book.order('buy_count DESC').limit(quantity)
      # best_seller_ids = OrderItem
      #                   .where(order: Order.delivered)
      #                   .group(:book_id)
      #                   .order('count_all DESC')
      #                   .limit(quantity)
      #                   .count(:all)
      #                   .keys
      #
      # Book.where(id: best_seller_ids)
    end
  end
end
