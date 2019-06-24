class BooksController < ApplicationController
  BOOKS_ON_PAGE = 12.freeze
  include Pagy::Backend
  before_action :setup_filter_sort, only: :index

  def index
    @categories = Category.all
    @pagy, @books = pagy(query_books, items: BOOKS_ON_PAGE)
    @presenter = BooksPresenter.new(@category, @books)
  end

  def show
    @categories = Category.all
    @book = Book.where(id: params[:id])
  end

  private

  def setup_filter_sort
    @category = params[:category]
    @current_sort = params[:sort]
  end

  def query_books
    BooksQuery.new(params[:category]).books_sort(params[:sort])
  end
end
