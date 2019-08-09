module Comments
  class Create
    include Interactor

    def call
      book = Book.find(context.book_id)
      comment = Comment.new(context.params) do |model|
        model.book = book
        model.user = context.user
        model.verified = true if user_buy_book?
      end

      context.comment = comment
      context.fail! unless comment.save
    end

    private

    def user_buy_book?
      order_ids = Order.delivered.where(user: context.user).ids
      OrderItem.where(book_id: context.book_id, order_id: order_ids).exists?
    end
  end
end
