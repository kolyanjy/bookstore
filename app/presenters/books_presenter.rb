class BooksPresenter
  def category_books_count(id)
    Books::CategoryQuery.new.call(id).count
  end

  def books_count
    Book.all.count
  end
end
