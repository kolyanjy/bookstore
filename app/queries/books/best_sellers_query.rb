module Books
  class BestSellersQuery
    NUMBER_BEST_SELLER = 4

    def call
      books = Book.where().limit(NUMBER_BEST_SELLER)
      books.decorate
    end
  end
end
