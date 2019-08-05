module Home
  class TakeBestSellers
    include Interactor

    NUMBER_BEST_SELLER = 4

    def call
      books = Book.where().limit(NUMBER_BEST_SELLER)
      context.best_sellers = books.decorate
    end
  end
end
