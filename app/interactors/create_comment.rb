class CreateComment
  include Interactor

  delegate :params, to: :context

  def call
    comment = Comment.new(title: context.title, description: context.description,
                          mark: context.mark, user_id: context.user_id, book_id: context.book_id )
    comment.save
  end
end
