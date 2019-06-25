class CreateCollection
  include Interactor

  def call
    params = context.params
    context.books = BooksSortQuery.new.books_sort(BooksCategoryQuery.new.call(params[:category]), params[:sort])
  end
end
