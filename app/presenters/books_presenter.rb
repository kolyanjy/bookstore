class BooksPresenter
  def initialize(category = nil, books = nil)
    @category = category
    @books = books
  end

  def category_books_count(id)
    Book.by_category(id).count
  end

  def books_count
    Book.all.count
  end
end
