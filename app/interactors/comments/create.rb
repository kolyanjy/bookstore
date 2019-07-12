module Comments
  class Create
    include Interactor

    def call
      book = Book.find(context.book_id)
      comment = Comment.new(context.params) do |model|
        model.book = book
        model.user = context.current_user
      end

      context.comment = comment
      context.fail! unless comment.save
    end
  end
end
