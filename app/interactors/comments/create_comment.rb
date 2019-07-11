module Comments
  class CreateComment
    include Interactor

    def call
      comment = Comment.new(context.params) do |coment|
        coment.book_id = context.book_id
        coment.user = context.current_user
      end

      context.comment = comment
      context.fail! unless comment.save
    end
  end
end
