class CreatePaginateCollection
  include Pagy::Backend
  include Interactor
  BOOKS_ON_PAGE = 12

  def call(category, sort)
    books = BooksSortQuery.new.books_sort(BooksCategoryQuery.new.call(category, sort))
    pagy(query_books, items: BOOKS_ON_PAGE)
  end

  def query_books
  end
end
