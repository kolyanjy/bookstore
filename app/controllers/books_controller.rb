class BooksController < ApplicationController
  include Pagy::Backend
  BOOKS_ON_PAGE = 12

  def index
    @pagy, @books = pagy(CreateCollection.call(params: params).books, items: BOOKS_ON_PAGE)
    @presenter = BooksPresenter.new
  end

  def show
    @book = Book.where(id: params[:id])
  end
end
