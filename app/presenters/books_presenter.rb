class BooksPresenter
  def category_books_count(id)
    Books::CategoryQuery.new.call(id).count
  end

  def books_count
    Book.all.count
  end

  def check_filter(filter)
    filter_exist?(filter) ? filter : Books::SortQuery::DEFAULT_FILTER
  end

  private

  def filter_exist?(filter)
    return false if filter.nil?

    Books::SortQuery::FILTERS.include?(filter.to_sym)
  end
end
