module Books
  class BestSellersQuery
    def call(quantity)
      Book.order('buy_count DESC').limit(quantity)
    end
  end
end
