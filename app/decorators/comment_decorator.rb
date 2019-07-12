class CommentDecorator < Draper::Decorator
  delegate_all

  def gray_stars_count(mark_num)
    Comment::COUNT_STARTS - mark_num
  end

  def first_char_user_email
    comment.user_email.first
  end
end
