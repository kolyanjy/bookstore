class BooksController < ApplicationController
  def index
    interector_call = CreateCollection.call(params: params)
    @pagy = interector_call.pagy
    @books = interector_call.books
    @presenter = BooksPresenter.new
  end

  def show
    @book = Book.find_by!(id: params[:id]).decorate
    @presenter = BookPresenter.new(@book)
  end
end
