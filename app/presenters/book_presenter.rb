class BookPresenter
  def initialize(book)
    @comments = book.comments
  end

  def comments
    @comments.where(verified: true).order(created_at: :desc)
  end
end
