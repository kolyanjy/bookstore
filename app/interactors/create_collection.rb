class CreateCollection
  include Interactor

  def call
    params = context.params
    books = Books::CategoryQuery.new.call(params[:category])
    books = Books::SortQuery.new.call(books, params[:sort])
    context.books = books
  end
end
