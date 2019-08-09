class CreateCollection
  include Interactor
  include Pagy::Backend
  BOOKS_ON_PAGE = 12
  MAX_LOADED_BOOKS = 10_000

  delegate :params, to: :context

  def call
    books = Books::CategoryQuery.new.call(params[:category])
    books = Books::SortQuery.new.call(books, params[:sort])
    pagy, books = pagy(books, items: BOOKS_ON_PAGE)

    context.books = books.decorate
    context.pagy = pagy
  end
end
