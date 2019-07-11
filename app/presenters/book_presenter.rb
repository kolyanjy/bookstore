class BookPresenter
  COUNT_STARTS = 5

  def initialize(book)
    @comments = book.comments
  end

  def comments
    @comments.where(verified: true).order(created_at: :desc)
  end

  delegate :count, to: :comments, prefix: true

  def gray_stars_count(mark_num)
    COUNT_STARTS - mark_num
  end

  def date_created_at(comment)
    comment.created_at.strftime('%d/%m/%Y')
  end

  def first_char_user_email(comment)
    comment.user.email.first
  end
end
