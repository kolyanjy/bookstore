module Home
  class TakeBestSellers
    include Interactor

    NUMBER_BEST_SELLER = 4

    def call
      books = Books::BestSellersQuery.new.call(NUMBER_BEST_SELLER)
      context.best_sellers = books.decorate
    end
  end
end
