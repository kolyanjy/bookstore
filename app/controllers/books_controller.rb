class BooksController < ApplicationController
  BOOKS_ON_PAGE = 12
  include Pagy::Backend

  def index
    @pagy, @books = pagy(query_books, items: BOOKS_ON_PAGE)
    @presenter = BooksPresenter.new
  end

  def show
    @book = Book.where(id: params[:id])
  end

  private

  def query_books
    BooksSortQuery.new.books_sort(BooksCategoryQuery.new.call(params[:category]), params[:sort])
  end
end
