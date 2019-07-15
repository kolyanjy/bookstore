class CommentDecorator < Draper::Decorator
  delegate_all

  def gray_stars_count
    Comment::COUNT_STARTS - comment.mark
  end

  def first_char_user_email
    comment.user_email.first
  end
end
