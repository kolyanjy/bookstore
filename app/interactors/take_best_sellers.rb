class TakeBestSellers
  include Interactor

  NUMBER_BEST_SELLER = 4

  def call
    books = Book.order('id').limit(NUMBER_BEST_SELLER)
    context.best_sellers = books.decorate
  end
end
