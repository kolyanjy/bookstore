module CommentsHelper
  def radio_btn_option
    Array.new(Comment::COUNT_STARTS) { |i| [i.next] }
  end
end
